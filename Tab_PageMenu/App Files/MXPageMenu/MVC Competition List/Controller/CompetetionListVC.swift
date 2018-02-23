//
//  CompetetionListVC.swift
//  Tab_PageMenu
//
//  Created by Anurag on 22/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CompetetionListVC: UIViewController {

    @IBOutlet weak var competetionTableViewOutlet: CompetetionTableView!
    
    var myJsonResponse  : JSON = JSON.null
    var competetion : [CompetetionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCompetetionList()
       
    }
    
    //MARK:- fetchCompetetionList
    
    func fetchCompetetionList() {
        
        APIManager.sharedInstance.competetionFromURL(){(competetionJson) -> Void in
            
            if competetionJson != JSON.null {
                
                self.myJsonResponse =  competetionJson
                
                for i in 0..<self.myJsonResponse.count{
                    
                    let singleCompetetion = CompetetionModel(competetionJSON: self.myJsonResponse[i])
                    self.competetion.append(singleCompetetion)
                    
                }
                
                DispatchQueue.main.async(execute: {
                    self.competetionTableViewOutlet.dataSourceArray=self.competetion
                    
                })
            }
        }
    }
}
