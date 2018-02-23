//
//  CompetetionModel.swift
//  Tab_PageMenu
//
//  Created by Anurag on 22/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import Foundation
import SwiftyJSON

class CompetetionModel{
    
    var statusCode : String!
    var statusMessage : String!
    var result : ResultModelClass!
    
    public init(competetionJSON:JSON) {
        
        self.statusCode = competetionJSON["statusCode"].stringValue
        self.statusMessage = competetionJSON["statusMessage"].stringValue
        self.result = ResultModelClass.init(resultJSON: competetionJSON["result"])    }
}

class ResultModelClass{
    
    var cid : String!
    var active : String!
    var description : String!
    var tagline : String!
    var terms : String!
    var title : String!
    var updated : String!
    var winner_uid : String!
    var img_url : String!
    
    init(resultJSON:JSON){
        
        self.cid = resultJSON["cid"].stringValue
        self.active = resultJSON["active"].stringValue
        self.description = resultJSON["description"].stringValue
        self.tagline = resultJSON["tagline"].stringValue
        self.terms = resultJSON["terms"].stringValue
        self.title = resultJSON["title"].stringValue
        self.updated = resultJSON["updated"].stringValue
        self.winner_uid = resultJSON["winner_uid"].stringValue
        self.img_url = resultJSON["img_url"].stringValue

    }
        
}

