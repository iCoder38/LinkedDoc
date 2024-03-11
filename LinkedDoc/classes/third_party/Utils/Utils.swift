//
//  Utils.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit

var navigation_color = UIColor.init(red: 58.0/255.0, green: 159.0/255.0, blue: 246.0/255.0, alpha: 1)
var app_bg_color = UIColor.init(red: 198.0/255.0, green: 219.0/255.0, blue: 247.0/255.0, alpha: 1)
// 45 53 78
var button_dark_blue_color = UIColor.init(red: 45.0/255.0, green: 53.0/255.0, blue: 78.0/255.0, alpha: 1)
var button_light_blue_color = UIColor.init(red: 72.0/255.0, green: 133.0/255.0, blue: 247.0/255.0, alpha: 1)
var text_field_BG_color = UIColor.init(red: 235.0/255.0, green: 239.0/255.0, blue: 249.0/255.0, alpha: 1)

var default_key_language = "key_select_language"
var english_language = "en"
var chinese_language = "ch"

class Utils: NSObject {

    class func light_vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    class func medium_vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    class func heavy_vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    
    
}

extension UIViewController {
    
    @objc func back_click_method() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}


extension UITextField {
    
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
