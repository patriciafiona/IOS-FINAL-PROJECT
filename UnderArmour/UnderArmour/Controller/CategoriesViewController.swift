//
//  CategoriesViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import Foundation

import UIKit

class CategoriesViewController: UIViewController, UITabBarControllerDelegate{
    
    @IBOutlet weak var menBtn: UIButton!
    @IBOutlet weak var womenBtn: UIButton!
    @IBOutlet weak var kidsBtn: UIButton!
    @IBOutlet weak var categoryTitle: UILabel!
    
    @IBOutlet weak var categoryTopsImg: UIImageView!
    @IBOutlet weak var categoryBottomsImg: UIImageView!
    @IBOutlet weak var categoryShoesImg: UIImageView!
    
    private var currentPosition: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentCategeory(currentPosition)
   }
    
    @IBAction func MenOnClick(_ sender: Any) {
        currentPosition = 0
        showCurrentCategeory(currentPosition)
    }
    
    @IBAction func WomenOnClick(_ sender: Any) {
        currentPosition = 1
        showCurrentCategeory(currentPosition)
    }
    
    @IBAction func KidsOnClick(_ sender: Any) {
        currentPosition = 2
        showCurrentCategeory(currentPosition)
    }
    
    func showCurrentCategeory(_ position: Int){
        switch position {
            case 0:
                categoryTitle.text = "Men"
                
                categoryTopsImg.image = UIImage(named: "men_tops_prev")
                categoryBottomsImg.image = UIImage(named: "men_bottoms_prev")
                categoryShoesImg.image = UIImage(named: "men_shoes_prev")

            case 1:
                categoryTitle.text = "Women"
                
                categoryTopsImg.image = UIImage(named: "women_tops_prev")
                categoryBottomsImg.image = UIImage(named: "women_bottoms_prev")
                categoryShoesImg.image = UIImage(named: "women_shoes_prev")

            case 2:
                categoryTitle.text = "Kids"
                
                categoryTopsImg.image = UIImage(named: "kids_tops_prev")
                categoryBottomsImg.image = UIImage(named: "kids_bottoms_prev")
                categoryShoesImg.image = UIImage(named: "kids_shoes_prev")

            default:
                print("Unknown Category")
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        
        showCurrentCategeory(tabBarIndex)
        print("index: \(tabBarIndex)")
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listProductViewController = segue.destination as! ListProductsViewController
        
        listProductViewController.category = categoryTitle.text ?? ""
        var tag = ""
        
        if segue.identifier == "seeTopsSeague"{
            tag = "Tops"
        }else if segue.identifier == "seeBottomsSeague"{
            tag = "Bottoms"
            
        }else if segue.identifier == "seeShoesSeague"{
            tag = "Shoes"
        }
        
        listProductViewController.tag = tag
        
        if tag != ""{
            listProductViewController.navigationItem.title = "\(categoryTitle.text ?? "") - \(tag) Collections"
        }else{
            listProductViewController.navigationItem.title = "\(categoryTitle.text ?? "") Collections"
        }
        
    }
    
}
