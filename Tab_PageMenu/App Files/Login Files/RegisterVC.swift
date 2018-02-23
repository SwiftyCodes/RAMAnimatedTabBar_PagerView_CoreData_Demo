//
//  RegisterVC.swift
//  Tab_PageMenu
//
//  Created by Anurag on 20/01/18.
//  Copyright © 2018 Anurag Kashyap. All rights reserved.
//

import UIKit
import CoreData


class RegisterVC: UIViewController {

    @IBOutlet weak var textUserName: FloatLabelTextField!
    @IBOutlet weak var textEmailID: FloatLabelTextField!
    @IBOutlet weak var textPassword: FloatLabelTextField!
    @IBOutlet weak var textConfirmPassword: FloatLabelTextField!
    @IBOutlet weak var uploadImage:UIImageView!
    @IBOutlet weak var checkBox: UIButton!
    
     var picker:UIImagePickerController?=UIImagePickerController()
    var imageData = Data()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var checkuncheckBool = false
    
    @IBAction func checkBoxButtonAction(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        print(sender.isSelected)
        if sender.isSelected == true {
            
            checkuncheckBool = true
        }
        else{
            checkuncheckBool = false
        }
    }
    
    @IBAction func uploadImage(_ sender : UIButton) {
  
         self.openGallery()
        
    }
    
    func openGallery()
    {
        picker?.delegate=self
        picker!.allowsEditing = false
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(picker!, animated: true, completion: nil)
    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
        
        if textUserName.text == "" {
            alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Please enter username")
        }
        if textEmailID.text == "" {
            alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Please enter email ID")
        }
        else if(textPassword.text == "") {
            alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Please enter password")
        }
        else if(textConfirmPassword.text == "") {
            alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Please confirm the password")
        }
        else if(textPassword.text != textConfirmPassword.text) {
            alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Password does not match")
        }
        else if(checkuncheckBool == false) {
            alertCreation(alertTitle: "Cread", buttonTitle: "Ok", message: "Please accept terms and conditions.")
        }else {
            SaveToCoreData()
        }
    }
    
    func SaveToCoreData() {
        
        //AppDelegates so we need to refer that container.
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        // create a context from this container.
        let context = appDelegate.persistentContainer.viewContext
        
        // create an entity and new user records.
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(textEmailID.text!, forKeyPath: "email")
        newUser.setValue(textPassword.text!, forKeyPath: "password")
        newUser.setValue(textUserName.text, forKeyPath: "username")
        newUser.setValue(imageData, forKeyPath: "image")
        
        //Saving the data
        
        do {
            try context.save()
            showalert()
        } catch {
            print("Failed saving the data")
        }
    }

    func showalert() {
        
        let uiAlert = UIAlertController(title: "Success", message: "You have successfully registered", preferredStyle: UIAlertControllerStyle.alert)
       
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            
                self.showLoginScreen()
                
            }))
        
         self.present(uiAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func dimissAction(_ sender: UIButton) {
   
        showLoginScreen()
    }
    
    func showLoginScreen() {
        let popup : LoginVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVc") as! LoginVc
        self.present(popup, animated: true, completion: nil)
    }
    
}

extension RegisterVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let cameraImageis = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        uploadImage.image = cameraImageis
        imageData = (UIImagePNGRepresentation(uploadImage.image!) as Data?)!
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
}
