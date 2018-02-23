//
//  APIManager.swift
//  Tab_PageMenu
//
//  Created by Anurag on 22/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager{
    
    static let sharedInstance = APIManager()
    var tempResponse : JSON? = nil
    
    private init(){
        
    }
    
    func competetionFromURL(onCompletion:@escaping (JSON)->Void){
        
        let url =   NSURL(string: Constants().baseURL+"competition/list")
        var request =   URLRequest(url: url! as URL)
        request.httpMethod="GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(request as URLRequestConvertible).responseJSON(){ response in
            
            switch response.result
            {
            case .success(let data):
                
                self.tempResponse = JSON(data)
                onCompletion(self.tempResponse!)
                
            case .failure(let error):
                print(error)
                onCompletion(JSON.null)
            }
        }
    }
}
