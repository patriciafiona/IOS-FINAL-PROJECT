//
//  ListFavoriteViewModel.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 28/06/21.
//

import Foundation
import UIKit

class ProductFavTableViewCell: UITableViewCell {
    @IBOutlet weak var productFavCellImage: UIImageView!
    @IBOutlet weak var productFavCellName: UILabel!
    @IBOutlet weak var productFavCellPrice: UILabel!
}

class ListFavoriteViewController: UITableViewController{
    
    struct PropertyKeys {
        static let productCell = "ProductFavCell"
        static let showProductDetail = "ShowFavProductDetail"
    }
    
    private var listId: String = ""
    
    private let basedURLForProductFav = "http://127.0.0.1:3000/productFavorite"
    private var url: String = ""
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
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listId = ""
        url = ""
        
        if UserDefaults.standard.object(forKey: "listFavorites") != nil{
            let getListFav = UserDefaults.standard.object(forKey: "listFavorites") as! [[String : Int]]
            if !getListFav.isEmpty{
                getAndSetData()
            }else{
                print("Data Empty")
                
                let alert = UIAlertController(title: "Empty Favorite List", message: "You Don't Have any Favorite Product", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                present(alert, animated: true, completion: nil)
                
                //clear all table row
                productsSpace = []
                self.tableView.reloadData()
            }
        }else{
            print("Data Empty - list not yet created")
            
            let alert = UIAlertController(title: "Empty Favorite List", message: "You Don't Have any Favorite Product", preferredStyle: .alert)
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
        getFavProductId()
        
        var url = URLComponents(string: basedURLForProductFav)!

        url.queryItems = [
            URLQueryItem(name: "ids", value: listId)
        ]
        
        print(url)
        
        FetchData().fetchDataWithParams(urlForFetchingData: url, completionHandler: {
            productArray in self.productsSpace = productArray
        })
    }
    
    private func getFavProductId(){
        if UserDefaults.standard.object(forKey: "listFavorites") != nil {
            let getListFav = UserDefaults.standard.object(forKey: "listFavorites") as! [[String : Int]]
            for (index, fav) in getListFav.enumerated(){
                for value in fav.values {
                    if index == 0{
                        listId += "\(value)"
                    }else if index < getListFav.count-1{
                        listId += ", \(value), "
                    }else if index == getListFav.count-1{
                        listId += ", \(value)"
                    }
                    
                }
            }
        }else{
            listId = ""
            print("No Favorite Products")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsSpace.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.productCell, for: indexPath) as! ProductFavTableViewCell
        
        let product = productsSpace[indexPath.row]
        FetchImageURL().setImageToImageView(imageContainer: cell.productFavCellImage, imageUrl: "http://127.0.0.1:3000/images/\(product.photo_01)")
        cell.productFavCellName?.text = product.name
        cell.productFavCellPrice?.text = priceFormat(price: product.price)
        
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
