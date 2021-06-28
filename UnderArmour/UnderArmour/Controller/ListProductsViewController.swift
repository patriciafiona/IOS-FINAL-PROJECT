//
//  ListProductsViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productCellImage: UIImageView!
    @IBOutlet weak var productCellName: UILabel!
    @IBOutlet weak var productCellPrice: UILabel!
}

class ListProductsViewController: UITableViewController{
    
    struct PropertyKeys {
        static let productCell = "ProductCell"
        static let showProductDetail = "ShowProductDetail"
    }
    
    var category:String = ""
    var tag:String = ""
    
    private let basedURLForProduct = "http://127.0.0.1:3000/products/"
    private var url: String = ""
    var productsSpace = [Products](){
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        //get data from API
        if tag != ""{
            url = basedURLForProduct + category + "/" + tag
        }else{
            url = basedURLForProduct + category
        }
        
        print(url)
        FetchData().fetchData(urlForFetchingData: url, completionHandler: {
            productArray in self.productsSpace = productArray
        })
        
        super.viewDidLoad()
        
        print("category: \(category), tag: \(tag)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsSpace.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.productCell, for: indexPath) as! ProductTableViewCell
        
        let product = productsSpace[indexPath.row]
        FetchImageURL().setImageToImageView(imageContainer: cell.productCellImage, imageUrl: "http://127.0.0.1:3000/images/\(product.photo_01)")
        cell.productCellName?.text = product.name
        cell.productCellPrice?.text = priceFormat(price: product.price)
        
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
