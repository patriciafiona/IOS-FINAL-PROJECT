//
//  ShoppingCartViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 30/06/21.
//

import Foundation
import UIKit

class ProductCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productCartCellQuantity: UILabel!
    @IBOutlet weak var productCartCellImage: UIImageView!
    @IBOutlet weak var productCartCellName: UILabel!
    @IBOutlet weak var productCartCellPrice: UILabel!
    
}

class ShoppingCartViewController: UITableViewController{
    
    struct PropertyKeys {
        static let productCell = "ProductCartCell"
        static let showProductDetail = "ShowCartProductDetail"
    }
    
    @IBOutlet weak var totalPriceText: UILabel!
    
    private var listId: String = ""
    private var listQuantity = [[String: String]]()
    
    //the path is same with API for get list of fav product
    private let basedURLForProductFav = "http://127.0.0.1:3000/productFavorite"
    private var url: String = ""
    private var totalPrice: Double = 0.0
    var productsSpace = [Products](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        listId = ""
        url = ""
        listQuantity = [[String: String]]()
        totalPrice = 0.0
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listId = ""
        url = ""
        listQuantity = [[String: String]]()
        totalPrice = 0.0
        
        if UserDefaults.standard.object(forKey: "shoppingCart") != nil{
            let getListCart = UserDefaults.standard.object(forKey: "shoppingCart") as! [[String : String]]
            if !getListCart.isEmpty{
                getAndSetData()
            }else{
                print("Data Empty")
                
                let alert = UIAlertController(title: "Empty Shopping Cart", message: "You Don't Have any Product in Shopping Cart", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                present(alert, animated: true, completion: nil)
                
                //clear all table row
                productsSpace = []
                self.tableView.reloadData()
            }
        }else{
            print("Data Empty - list not yet created")
            
            let alert = UIAlertController(title: "Empty Shopping Cart", message: "You Don't Have any Product in Shopping Cart", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
            
            //clear all table row
            productsSpace = []
            self.tableView.reloadData()
        }
        
        super.viewDidAppear(animated)
    }
    
    private func getAndSetData(){
        //get list of Id
        getCartProductIdAndTotalPrice()
        
        var url = URLComponents(string: basedURLForProductFav)!

        url.queryItems = [
            URLQueryItem(name: "ids", value: listId)
        ]
        
        print(url)
        
        FetchData().fetchDataWithParams(urlForFetchingData: url, completionHandler: {
            productArray in self.productsSpace = productArray
        })
    }
    
    private func getCartProductIdAndTotalPrice(){
        if UserDefaults.standard.object(forKey: "shoppingCart") != nil {
            let getListCart = UserDefaults.standard.object(forKey: "shoppingCart") as! [[String : String]]
            for (index, fav) in getListCart.enumerated(){
                let productId = fav["product_id"]!
                
                if index == 0{
                    listId += productId
                }else if index < getListCart.count-1{
                    listId += ", \(productId), "
                }else if index == getListCart.count-1{
                    listId += ", \(productId)"
                }
                
                let quantity = fav["quantity"]!
                let qData = (["product_id": productId, "quantity": quantity])
                listQuantity.append(qData)
                
                print(listId)
            }
        }else{
            listId = ""
            print("No Cart Products")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsSpace.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.productCell, for: indexPath) as! ProductCartTableViewCell
        
        let product = productsSpace[indexPath.row]
        FetchImageURL().setImageToImageView(imageContainer: cell.productCartCellImage, imageUrl: "http://127.0.0.1:3000/images/\(product.photo_01)")
        cell.productCartCellName?.text = product.name
        cell.productCartCellPrice?.text = priceFormat(price: product.price)
        
        for data in listQuantity{
            if data["product_id"] == String(product.id) {
                cell.productCartCellQuantity.text = "x\(data["quantity"] ?? "0")"
                
                totalPrice += Double(data["quantity"]!)! * product.price
                totalPriceText.text = priceFormat(price: totalPrice)
            }
        }
        
        return cell
    }
    
    private func priceFormat(price: Double)-> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        if let formattedTipAmount = formatter.string(from: price as NSNumber) {
           return ("Rp " + formattedTipAmount + ",00")
        }
        
        return ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.showProductDetail {
            let detailProductViewController = segue.destination as! DetailProductViewController
            detailProductViewController.product = productsSpace[indexPath.row]
        }
    }
    
}
