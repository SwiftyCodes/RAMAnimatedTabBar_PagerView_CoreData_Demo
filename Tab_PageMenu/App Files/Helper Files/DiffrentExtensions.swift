//
//  DiffrentExtensions.swift
//  Tab_PageMenu
//
//  Created by Anurag on 20/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import Foundation
import UIKit

extension RegisterVC {
    
    func cantOpenPicker(withSource source:UIImagePickerControllerSourceType) {
        
        let sourceName : String
        
        switch source {
        case .camera : sourceName = "Camera"
        case .photoLibrary : sourceName = "Photo Library"
        case .savedPhotosAlbum : sourceName = "Saved Photos Album"
      
        }
        
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        let alertVC = UIAlertController(title: "Sorry", message: "Can't access your \(sourceName)", preferredStyle: .alert)
        
        alertVC.addAction(alertAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    
}
