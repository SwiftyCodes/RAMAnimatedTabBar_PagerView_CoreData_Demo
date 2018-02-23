//
//  ViewController.swift
//  Tab_PageMenu
//
//  Created by Anurag on 19/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       UserDefaults.standard.set("passedOnboardingAlready", forKey: "passedOnboardingAlready")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}
