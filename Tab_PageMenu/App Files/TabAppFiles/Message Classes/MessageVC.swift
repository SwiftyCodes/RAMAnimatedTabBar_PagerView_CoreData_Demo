//
//  MessageVC.swift
//  Tab_PageMenu
//
//  Created by Anurag on 19/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit
import CoreData
import AlamofireImage
import Alamofire

class MessageVC: UIViewController {
    
    @IBOutlet weak var tableViewOutlet : UITableView!
    
    var userNameArray = [String]() {
        didSet {
            
            tableViewOutlet.reloadData()
            
        }
    }
    
    var emailID = [String]()
    var imageArray = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoreDataResult()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    func fetchCoreDataResult(){
        
        //AppDelegates so we need to refer that container.
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        // create a context from this container.
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                userNameArray.append(data.value(forKey: "username") as! String)
                emailID.append(data.value(forKey: "email") as! String)
                imageArray.append(data.value(forKey: "image") as! Data)
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
}

extension MessageVC : UITabBarDelegate {
    
}

extension MessageVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessageCell
        cell.username.text = userNameArray[indexPath.row]
        cell.email.text = emailID[indexPath.row]
        
        let imageDisplayAtCell = UIImage(data: imageArray[indexPath.row] )
        cell.imageView?.image = imageDisplayAtCell

        return cell
    }
}

class MessageCell : UITableViewCell {
    
    @IBOutlet weak var cellimageView: UIImageView!
    @IBOutlet weak var username : UILabel!
    @IBOutlet weak var email : UILabel!
    
}
