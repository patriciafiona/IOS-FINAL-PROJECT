//
//  DetailViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import Foundation
import UIKit

class DetailProductViewController: UIViewController{
    
    var product: Products?
    
    
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
        
        setDetails()
        
        setImageListener()
        
        setRoundedButton(button: btnAddToBag)
        setRoundedButton(button: btnFavorite)
    }
    
    private func setImageListener(){
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped(gesture:)))

        productImage.addGestureRecognizer(tapGesture)
        productImage.isUserInteractionEnabled = true
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
        let imgProducts_02 = UIImageView(image: UIImage(named: "image_placeholder"))
        let imgProducts_03 = UIImageView(image: UIImage(named: "image_placeholder"))
        
        FetchImageURL().setImageToImageView(imageContainer: imgProducts_01, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_01)")
        FetchImageURL().setImageToImageView(imageContainer: imgProducts_02, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_02)")
        FetchImageURL().setImageToImageView(imageContainer: imgProducts_03, imageUrl: "http://127.0.0.1:3000/images/\(product!.photo_03)")
        
        imgProducts_01.translatesAutoresizingMaskIntoConstraints = false
        imgProducts_01.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
        
        imgProducts_02.translatesAutoresizingMaskIntoConstraints = false
        imgProducts_02.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
        
        imgProducts_03.translatesAutoresizingMaskIntoConstraints = false
        imgProducts_03.widthAnchor.constraint(equalToConstant: horizontalScrollableStackView.frame.height).isActive = true
        
        imgProducts_01.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
        imgProducts_02.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
        imgProducts_03.frame = CGRect(x: 0, y: 0, width: 25, height: 200)
        
        //add tap gesture lsitener
        let tapGesture01 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped(gesture:)))
        let tapGesture02 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped02(gesture:)))
        let tapGesture03 = UITapGestureRecognizer(target: self, action: #selector(DetailProductViewController.imageTapped03(gesture:)))

        imgProducts_01.addGestureRecognizer(tapGesture01)
        imgProducts_02.addGestureRecognizer(tapGesture02)
        imgProducts_03.addGestureRecognizer(tapGesture03)
        
        imgProducts_01.isUserInteractionEnabled = true
        imgProducts_02.isUserInteractionEnabled = true
        imgProducts_03.isUserInteractionEnabled = true
        
        //add to horizontal view
        horizontalScrollableStackView.addArrangedSubview(imgProducts_01)
        horizontalScrollableStackView.addArrangedSubview(imgProducts_02)
        horizontalScrollableStackView.addArrangedSubview(imgProducts_03)
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
}