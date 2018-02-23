//
//  CompetetionTableView.swift
//  Tab_PageMenu
//
//  Created by Anurag on 22/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit

class CompetetionTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var dataSourceArray  =   [CompetetionModel](){
        didSet{
            reloadData()
        }
    }

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CompetitionCell", for: indexPath) as! CompetitionCell
//        let competetionValues = self.dataSourceArray[indexPath.row]
//        cell.competitionNameLabel.text = competetionValues.result.title
//        cell.tagLineLabel.text = competetionValues.result.tagline
        
        return UITableViewCell()
    }
}

