//
//  LoginVc.swift
//  Tab_PageMenu
//
//  Created by Anurag on 20/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit
import CoreData

class LoginVc: UIViewController {
    
    @IBOutlet weak var textUserName: FloatLabelTextField!
    @IBOutlet weak var textPassword: FloatLabelTextField!

    var username = ""
    var password = ""
    var checkRecord = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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
            if result.count != 0 {
                for data in result as! [NSManagedObject] {
                    
                    username = data.value(forKey: "username") as! String
                    password = data.value(forKey: "password") as! String
                    
                    if username != textUserName.text && password != textPassword.text
                    {
                        alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Incorrect username or password")
                        
                    }else{
                        
                        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                        let initialViewController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "RamTabbarController") as! RAMAnimatedTabBarController
                        initialViewController.selectedIndex = 0
                        appDelegate.window?.rootViewController = initialViewController
                    }
                }

            }else {
                
                 alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "No data prsent in entity")
                
                
            }
            
        } catch {
            
            print("Failed")
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton){
        
        fetchCoreDataResult()
        
    }
    
    @IBAction func registerUserAction(_ sender: UIButton) {
        
        let popup : RegisterVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.present(popup, animated: true, completion: nil)
        
    }

}
