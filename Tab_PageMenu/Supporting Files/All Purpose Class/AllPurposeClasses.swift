//
//  AllPurposeClasses.swift
//  One Touch Contact
//
//  Created by admin  on 29/08/16.
//  Copyright © 2016 admin . All rights reserved.
//

import Foundation
import UIKit

public class allPurposeClasses{

    class func applyAnimation(textField:UITextField){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint:CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint:CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    class func roundedButton(button:UIButton) {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
    }
    

}

extension UIViewController {
    
    func alertCreation(alertTitle:String, buttonTitle:String, message:String) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UIImageView{
    
    
    func setImageFromURl(stringImageUrl url: String){
          DispatchQueue.global(qos: .background).async {
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                DispatchQueue.main.sync {
                    self.image = UIImage(data: data as Data)
                }
                }
            }
        }
        }
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    func jpeg(_ quality: JPEGQuality) -> Data? {
        return UIImageJPEGRepresentation(self, quality.rawValue)
    }
}

extension UIButton {

    func updateLayerProperties() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
    }
    
    /// Add image on left view
    func leftImage(image: UIImage) {
        self.setImage(image, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: image.size.width)
    }
    
}

extension UIView {
    func addGradientWithColor(color: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, color.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }

}

extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
}



