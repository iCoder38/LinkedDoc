//
//  extensions.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit
import Alamofire

extension UIViewController {
    
    @objc func please_check_your_internet_connection() {
        let alert = NewYorkAlertController(title: String("Error").uppercased(), message: String("Please check your Internet Connection"), style: .alert)
        let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
        alert.addButtons([cancel])
        self.present(alert, animated: true)
    }
    
    @objc func field_should_not_be_empty() {
        let alert = NewYorkAlertController(title: text_language.common_screen(status: "alert"), message: String("Please check your Internet Connection"), style: .alert)
        let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
        alert.addButtons([cancel])
        self.present(alert, animated: true)
    }
    
    @objc func back_click_method() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func sideBarMenu(button:UIButton) {
        self.view.endEditing(true)
        
        if revealViewController() != nil {
            button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
    }
    
    @objc func logout_click_method() {
        
        let alert = NewYorkAlertController(title: text_language.dashboard_screen(status: "#08"), message: text_language.common_screen(status: "logout_message"), style: .alert)
        
        let yes = NewYorkButton(title: text_language.dashboard_screen(status: "#08"), style: .default)  {
            _ in
            
            UserDefaults.standard.set(nil, forKey: str_save_login_user_data)
            UserDefaults.standard.set(nil, forKey: default_key_language)
            
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "select_language_id") as! select_language
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        }
        
        let cancel = NewYorkButton(title: text_language.common_screen(status: text_language.common_screen(status: "dismiss")), style: .cancel)
        alert.addButtons([yes,cancel])
        self.present(alert, animated: true)
        
    }
    
    @objc func success_message(message:String) {
        self.view.makeToast(message)
    }
    
}

extension Date {
    func dateString(_ format: String = "MMM-dd-YYYY, hh:mm a") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func dateByAddingYears(_ dYears: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = dYears
        return Calendar.current.date(byAdding: dateComponents, to: self)!
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
 
extension Date {
    static func get_current_date_and_time() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
        return dateFormatter.string(from: Date())
    }
}
