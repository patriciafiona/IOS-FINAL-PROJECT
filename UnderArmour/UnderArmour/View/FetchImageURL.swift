//
//  fetchImageURL.swift
//  UnderArmour
//
//  Created by Patricia Fiona on 28/06/21.
//

import Foundation
import UIKit

class FetchImageURL{
    
    init(){}
    
    func setImageToImageView(imageContainer: UIImageView, imageUrl: String) {
        FetchData().fetchImage(from: imageUrl, completionHandler: { (imageData) in
            if let data = imageData {
                // referenced imageView from main thread
                // as iOS SDK warns not to use images from
                // a background thread
                DispatchQueue.main.async {
                    imageContainer.image = UIImage(data: data)
                }
            } else {
                // show as an alert if you want to
                print("Error loading image");
            }
        })
    }
    
}
