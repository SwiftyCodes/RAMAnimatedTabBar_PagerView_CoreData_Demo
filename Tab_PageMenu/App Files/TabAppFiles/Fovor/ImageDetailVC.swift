//
//  ImageDetailVC.swift
//  Tab_PageMenu
//
//  Created by Anurag on 19/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit

class ImageDetailVC: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImage.image = image
        
    }
    
    @IBAction func backButtonAction (_ sender:UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
}
