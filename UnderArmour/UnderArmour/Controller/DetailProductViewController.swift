//
//  DetailViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import Foundation
import UIKit

import iOSDropDown

class DetailProductViewController: UIViewController{
    
    var product: Products?
    private var sizeVal = ""
    private var quantityVal = ""
    
    @IBOutlet weak var sizeDropdown: DropDown!
    @IBOutlet weak var quantityDropdown: DropDown!
    
    @IBOutlet weak var horizontalScrollableStackView: UIStackView!
    @IBOutlet weak var horizontalScrollView: UIScrollView!
    
    @IBOutlet weak var categoryDetailTxt: UILabel!
    @IBOutlet weak var productNameTxt: UILabel!
    @IBOutlet weak var productPriceTxt: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDetailTxt: UILabel!
    
    @IBOutlet weak var btnAddToBag: UIButton!
    @IBOutlet weak var btnFavorite: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDropdown()
        
        setDetails()
        
        setImageListener()
        
        setRoundedButton(button: btnAddToBag)
        setRoundedButton(button: btnFavorite)
        
        //check fav button status
        if UserDefaults.standard.object(forKey: "listFavorites") != nil {
            let getListFav = UserDefaults.standard.object(forKey: "listFavorites") as! [[String : Int]]
            upadteBtnFav(checkProductInList(getListFav))
        }
        
        //check cart button status
        if UserDefaults.standard.object(forKey: "shoppingCart") != nil {
            let getListCart = UserDefaults.standard.object(forKey: "shoppingCart") as! [[String : String]]
            updateBtnCart(checkProductInShoppingCart(getListCart))
        }
    }
    
    private func setDropdown(){
        //set Dropdown Size
        var arr = 0...1 //default
        
        if product?.tag_name == "Shoes"{
            if product?.category_name == "Kids"{
                arr = 30...38
            }else{
                arr = 36...45
            }
            
            let SizeArray = arr.map { String($0) }
            let SizeIndex = arr.map { Int($0) }
            
            sizeDropdown.optionIds = SizeIndex
            sizeDropdown.optionArray = SizeArray
        }else{
            //for tops and bottoms
            let sizeString = ["XS", "S", "M", "L", "XL", "XXL"]
            sizeDropdown.optionArray = sizeString
        }
        
        sizeDropdown.didSelect{(selectedText , index ,id) in
            print( "Selected String: \(selectedText) \n index: \(index)")
            self.sizeVal = selectedText
        }
        
        //set dropdown quantity
        arr = 1...10
        let SizeArray = arr.map { String($0) }
        let SizeIndex = arr.map { Int($0) }
        
        quantityDropdown.optionIds = SizeIndex
        quantityDropdown.optionArray = SizeArray
        
        quantityDropdown.didSelect{(selectedText , index ,id) in
            print( "Selected String: \(selectedText) \n index: \(index)")
            self.quantityVal = selectedText
        }
    }
    
    private func upadteBtnFav(_ status: Bool){
        if status{
            //already in fav list
            btnFavorite.setTitleColor(UIColor.white, for: .normal)
            btnFavorite.setTitle("Unfavorite", for: .normal)
            btnFavorite.backgroundColor = UIColor.red
        }else{
            //not yet in fav list
            btnFavorite.setTitleColor(UIColor.black, for: .normal)
            btnFavorite.setTitle("Favorite", for: .normal)
            btnFavorite.backgroundColor = UIColor.systemGray5
        }
    }
    
    private func updateBtnCart(_ status: Bool){
        if status{
            //already in cart
            btnAddToBag.setTitle("Remove from Bag", for: .normal)
        }else{
            //not yet in cart
            btnAddToBag.setTitle("Add to Bag", for: .normal)
        }
    }
    
    private func setImageListener(){
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped(gesture:)))

        productImage.addGestureRecognizer(tapGesture)
        productImage.isUserInteractionEnabled = true
    }
    
    @IBAction func addRemoveProductShoppingCart(_ sender: Any) {
        if sizeVal != "" && quantityVal != "" {
            //check if already in shopping cart or not
            let getListCart = UserDefaults.standard.object(forKey: "shoppingCart")
            
            if getListCart == nil {
                var jsonArray: [[String: String]] = [[String: String]]()

                let json = (["product_id": "\(product!.id)", "size": sizeVal, "quantity": quantityVal])
                jsonArray.append(json)
                
                //save in local storage
                UserDefaults.standard.set(jsonArray, forKey: "shoppingCart")
                
                updateBtnCart(true)
                
                print(jsonArray)
            }else{
                var jsonArray: [[String: String]] = getListCart as! [[String : String]]
                
                if checkProductInShoppingCart(jsonArray) == false{
                    print("Not yet in cart")
                    
                    let json = (["product_id": "\(product!.id)", "size": sizeVal, "quantity": quantityVal])
                    jsonArray.append(json)
                    
                    //save in local storage
                    UserDefaults.standard.set(jsonArray, forKey: "shoppingCart")
                    
                    updateBtnCart(true)
                    
                    print(jsonArray)
                }else{
                    print("Already in cart, remove from the List")
                    updateBtnCart(false)
                    
                    for (index, data) in jsonArray.enumerated(){
                        if data["product_id"] == "\(product!.id)"{
                            jsonArray.remove(at: index)
                            break
                        }
                    }
                    
                    //update data in local storage
                    UserDefaults.standard.set(jsonArray, forKey: "shoppingCart")
                    
                    print(jsonArray)
                }
                
            }
        }else{
            let alert = UIAlertController(title: "Empty Size or Quantity", message: "Please choose Size and Quantity first.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func favoriteBtnOnClick(_ sender: Any) {
        //check if data already in local storage
        
        let getListFav = UserDefaults.standard.object(forKey: "listFavorites")
        
        if getListFav == nil {
            var jsonArray: [[String: Int]] = [[String: Int]]()

            let json = (["product_id": product!.id])
            jsonArray.append(json )
            
            //save in local storage
            UserDefaults.standard.set(jsonArray, forKey: "listFavorites")
            
            upadteBtnFav(true)
            
            print(jsonArray)
        }else{
            var jsonArray: [[String: Int]] = getListFav as! [[String : Int]]
            
            if checkProductInList(jsonArray) == false{
                print("Not yet in fav")
                
                let json = (["product_id": product!.id])
                jsonArray.append(json )
                
                //save in local storage
                UserDefaults.standard.set(jsonArray, forKey: "listFavorites")
                
                upadteBtnFav(true)
                
                print(jsonArray)
            }else{
                print("Already in fav, remove from the List")
                upadteBtnFav(false)
                
                let currentProduct = (["product_id": product!.id])
                if let index = jsonArray.firstIndex(of: currentProduct ) {
                    jsonArray.remove(at: index)
                }
                
                //update data in local storage
                UserDefaults.standard.set(jsonArray, forKey: "listFavorites")
                
                print(jsonArray)
            }
            
        }
    }
    
    private func checkProductInList(_ jsonArray: [[String: Int]] ) -> Bool{
        let currentProduct = (["product_id": product!.id])
        
        var result = false
        
        for product in jsonArray{
            if product == currentProduct{
                result = true
                break
            }else{
                result = false
            }
        }
        
        return result
    }
    
    private func checkProductInShoppingCart(_ jsonArray: [[String: String]] ) -> Bool{
        
        var result = false
        
        for data in jsonArray{
            if data["product_id"] == "\(product!.id)"{
                sizeVal = data["size"]!
                sizeDropdown.text = sizeVal
                
                quantityVal = data["quantity"]!
                quantityDropdown.text = quantityVal
                result = true
                break
            }else{
                result = false
            }
        }
        
        return result
    }
    
    private func setDetails(){
        FetchImageURL().setImageToImageView(imageContainer: productImage, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_01)")
        productNameTxt.text = product!.name
        productPriceTxt.text = priceFormat(price: product!.price)
        categoryDetailTxt.text = "\(product!.category_name) - \(product!.tag_name)"
        productDetailTxt.text = product!.description
        setHorizontallScroll()
    }
    
    private func setHorizontallScroll(){
        //create empty image
        let imgProducts_01 = UIImageView(image: UIImage(named: "image_placeholder"))
        
        FetchImageURL().setImageToImageView(imageContainer: imgProducts_01, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_01)")
        
        imgProducts_01.translatesAutoresizingMaskIntoConstraints = false
        imgProducts_01.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
        
        imgProducts_01.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
        
        let tapGesture01 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped(gesture:)))
        
        imgProducts_01.addGestureRecognizer(tapGesture01)
        imgProducts_01.isUserInteractionEnabled = true
        horizontalScrollableStackView.addArrangedSubview(imgProducts_01)
        
        // Image 02 -------------------------------------
        if product!.photo_02 != ""{
            let imgProducts_02 = UIImageView(image: UIImage(named: "image_placeholder"))
            
            FetchImageURL().setImageToImageView(imageContainer: imgProducts_02, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_02)")
            
            imgProducts_02.translatesAutoresizingMaskIntoConstraints = false
            imgProducts_02.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
            
            imgProducts_02.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
            
            let tapGesture02 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped02(gesture:)))
            imgProducts_02.addGestureRecognizer(tapGesture02)
            imgProducts_02.isUserInteractionEnabled = true
            
            horizontalScrollableStackView.addArrangedSubview(imgProducts_02)
        }
        
        // Image 03 -------------------------------------
        
        if product!.photo_03 != ""{
            let imgProducts_03 = UIImageView(image: UIImage(named: "image_placeholder"))
            
            FetchImageURL().setImageToImageView(imageContainer: imgProducts_03, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_03)")

            imgProducts_03.translatesAutoresizingMaskIntoConstraints = false
            imgProducts_03.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
            imgProducts_03.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
            
            let tapGesture03 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped03(gesture:)))

            imgProducts_03.addGestureRecognizer(tapGesture03)
            imgProducts_03.isUserInteractionEnabled = true
            
            horizontalScrollableStackView.addArrangedSubview(imgProducts_03)
        }
        
        // Image 04 -------------------------------------
        
        if product!.photo_04 != ""{
            let imgProducts_04 = UIImageView(image: UIImage(named: "image_placeholder"))
            
            FetchImageURL().setImageToImageView(imageContainer: imgProducts_04, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_04)")

            imgProducts_04.translatesAutoresizingMaskIntoConstraints = false
            imgProducts_04.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
            imgProducts_04.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
            
            let tapGesture04 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped04(gesture:)))

            imgProducts_04.addGestureRecognizer(tapGesture04)
            imgProducts_04.isUserInteractionEnabled = true
            
            horizontalScrollableStackView.addArrangedSubview(imgProducts_04)
        }
        
        // Image 05 -------------------------------------
        
        if product!.photo_05 != ""{
            let imgProducts_05 = UIImageView(image: UIImage(named: "image_placeholder"))
            
            FetchImageURL().setImageToImageView(imageContainer: imgProducts_05, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_05)")

            imgProducts_05.translatesAutoresizingMaskIntoConstraints = false
            imgProducts_05.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
            imgProducts_05.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
            
            let tapGesture05 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped05(gesture:)))

            imgProducts_05.addGestureRecognizer(tapGesture05)
            imgProducts_05.isUserInteractionEnabled = true
            
            horizontalScrollableStackView.addArrangedSubview(imgProducts_05)
        }
        
    }
    
    private func setShadow(view: UIView){
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowRadius = 8.0
        view.layer.shadowColor = UIColor.darkGray.cgColor
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
    
    private func setRoundedButton(button: UIButton){
        var currentHeight: CGFloat?
        
        let group = DispatchGroup()
            group.enter()

            DispatchQueue.main.async {
                currentHeight = button.frame.height
                group.leave()
            }
        
        group.notify(queue: .main) {
            button.layer.cornerRadius = currentHeight! / 2.0
        }
    }

    @objc private func imageTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let imageDetailPage = self.storyboard?.instantiateViewController(withIdentifier: "imageDetailView") as! ImageDetailViewController
            
            imageDetailPage.imageName = product?.photo_01
            
            self.navigationController?.pushViewController(imageDetailPage, animated: true)
        }
    }
    
    @objc private func imageTapped02(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let imageDetailPage = self.storyboard?.instantiateViewController(withIdentifier: "imageDetailView") as! ImageDetailViewController
            
            imageDetailPage.imageName = product?.photo_02
            
            self.navigationController?.pushViewController(imageDetailPage, animated: true)
        }
    }
    
    @objc private func imageTapped03(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let imageDetailPage = self.storyboard?.instantiateViewController(withIdentifier: "imageDetailView") as! ImageDetailViewController
            
            imageDetailPage.imageName = product?.photo_03
            
            self.navigationController?.pushViewController(imageDetailPage, animated: true)
        }
    }
    
    @objc private func imageTapped04(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let imageDetailPage = self.storyboard?.instantiateViewController(withIdentifier: "imageDetailView") as! ImageDetailViewController
            
            imageDetailPage.imageName = product?.photo_04
            
            self.navigationController?.pushViewController(imageDetailPage, animated: true)
        }
    }
    
    @objc private func imageTapped05(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            let imageDetailPage = self.storyboard?.instantiateViewController(withIdentifier: "imageDetailView") as! ImageDetailViewController
            
            imageDetailPage.imageName = product?.photo_05
            
            self.navigationController?.pushViewController(imageDetailPage, animated: true)
        }
    }
}
