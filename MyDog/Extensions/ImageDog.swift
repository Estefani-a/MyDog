//
//  ImageDog.swift
//  MyDog
//
//  Created by Estefania Sassone on 08/08/2022.
//

import Foundation
import UIKit
import Alamofire

extension UIImageView {
    
    func loadFrom(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
    
    
}
