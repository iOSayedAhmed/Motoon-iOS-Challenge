//
//  UIImage + Extensions.swift
//  Starter Project
//
//  Created by iOSayed on 29/03/2023.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromUrl (from url:String){
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                }else{
                    guard let imageData = data else { return }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }
        }.resume()
        }
        
    }
}
