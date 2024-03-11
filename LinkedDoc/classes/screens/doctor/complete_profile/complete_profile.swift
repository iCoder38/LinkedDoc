//
//  complete_profile.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit

class complete_profile: UIViewController {
    
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
        }
    }
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.view.backgroundColor = app_bg_color
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
    }
    
    
    
}

//MARK:- TABLE VIEW -
extension complete_profile: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:complete_profile_table_cell = tableView.dequeueReusableCell(withIdentifier: "complete_profile_table_cell") as! complete_profile_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.complete_profile_screen(status: "#01")
        
        cell.txt_complete_address.placeholder = text_language.complete_profile_screen(status: "#02")
        cell.txt_area_zipcode.placeholder = text_language.complete_profile_screen(status: "#03")
        cell.txt_working_hours.placeholder = text_language.complete_profile_screen(status: "#04")
        cell.txt_year_of_experience.placeholder = text_language.complete_profile_screen(status: "#05")
        cell.txt_specialization.placeholder = text_language.complete_profile_screen(status: "#06")
        
        cell.btn_finish.setTitle(text_language.complete_profile_screen(status: "#07"), for: .normal)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }

}
