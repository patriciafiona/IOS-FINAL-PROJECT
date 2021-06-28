//
//  ImageDetailViewController.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 27/06/21.
//

import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate {

    var imageName: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://127.0.0.1:3000/images/\(imageName ?? "product_default.png")"
        FetchImageURL().setImageToImageView(imageContainer: imageView, imageUrl: url)
        
        scrollView.delegate = self
        updateZoomFor(view.bounds.size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateZoomFor(_ size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = scale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}
