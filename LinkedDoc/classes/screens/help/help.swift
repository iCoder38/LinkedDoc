//
//  help.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 13/03/24.
//

import UIKit

class help: UIViewController {

    var str_back_menu:String!
    
    @IBOutlet weak var view_navigation:UIView! {
        didSet {
            view_navigation.backgroundColor = navigation_color
        }
    }
    @IBOutlet weak var lbl_navigation_title:UILabel! {
        didSet {
            lbl_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var btn_back:UIButton! {
        didSet {
            btn_back.tintColor = .white
            btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = text_field_BG_color
        
        if (self.str_back_menu == "back") {
            self.btn_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        } else {
            self.btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.sideBarMenu(button: self.btn_back)
        }
        
    }
}
