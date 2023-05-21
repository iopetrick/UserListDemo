//
//  ImageLoaderHelper.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import Foundation
import UIKit
@objc
public final class ImageLoaderHelper: NSObject {
    
    private var task: URLSessionTask?
    private var cacheData = NSCache<NSString, UIImage>()
    
    public override init() {
        
    }
    
    @objc
    public func loadImage(url: URL, imageView: UIImageView) {
        
        if let image = cacheData.object(forKey: url.absoluteString as NSString) {
            imageView.image = image
            return
        }
                
        task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Imageloading error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                print("Invalid response or bad data")
                return
            }
            
            self?.cacheData.setObject(image, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
        task?.resume()
    }
}
