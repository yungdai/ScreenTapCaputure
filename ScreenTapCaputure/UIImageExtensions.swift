//
//  UIImageExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2016-10-24.
//  Copyright © 2016 Yung Dai. All rights reserved.
//


import UIKit

extension UIImage {
    
    class func takeScreenshot(view: UIView) -> UIImage? {
        
        // Create screenshot
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        

        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let screenshot:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        print("Taking Screenshot")

        return screenshot
    }

    class func imageFromUrl(urlString: String) -> UIImage? {
        
        var returnedImage: UIImage?
        if let imageURL = URL(string: urlString) as URL? {
            
            DispatchQueue.global().async {
                
                let data = try? Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    
                    if let image = UIImage(data: data!) as UIImage? {
                        
                        returnedImage! = image
                    }
                }
            }
        }
        
        return returnedImage
    }
    

    
}
