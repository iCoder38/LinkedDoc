//
//  change_password.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit

class change_password: UIViewController {

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
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideBarMenu(button: self.btn_back)
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.view.backgroundColor = app_bg_color
    }
}

//MARK:- TABLE VIEW -
extension change_password: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:change_password_table_cell = tableView.dequeueReusableCell(withIdentifier: "change_password_table_cell") as! change_password_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.change_password_screen(status: "#01")
        
        cell.txt_old_password.text = text_language.change_password_screen(status: "#02")
        cell.txt_new_password.text = text_language.change_password_screen(status: "#03")
        cell.txt_confirm_password.text = text_language.change_password_screen(status: "#04")
        
        cell.btn_change_password.setTitle(text_language.change_password_screen(status: "#05"), for: .normal)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }

}
