//
//  UIImageExtension.swift
//  EasyNetworking
//
//  Created by DA SILVA Andre Henrique on 05/04/2017.
//  Copyright © 2017 a h e n q s. All rights reserved.
//

import UIKit

public protocol Cachable {}

private  let imageCache = NSCache<NSString, UIImage>()

extension UIImageView: Cachable {}

public extension Cachable where Self: UIImageView {
    
    public typealias SuccessCompletion = (Bool) -> ()
    
    public func loadImageUsingCacheWithURLString(_ URLString: String, placeHolder: UIImage?, completion: @escaping SuccessCompletion) {
        
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            
            DispatchQueue.main.async {
                self.image = cachedImage
                completion(true)
            }
            
            return
        }
        
        self.image = placeHolder
        
        if let url = URL(string: URLString) {
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    
                    if let data = data {
                        
                        if let downloadedImage = UIImage(data: data) {
                            
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            
                            DispatchQueue.main.async {
                                self.image = downloadedImage
                                completion(true)
                            }
                        }
                    }
                    
                } else {
                    
                    self.image = placeHolder
                }
                
            }).resume()
            
        } else {
            
            self.image = placeHolder
        }
    }
}
