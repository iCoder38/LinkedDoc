//
//  region.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit

class region: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


//MARK:- TABLE VIEW -
extension region: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:region_table_cell = tableView.dequeueReusableCell(withIdentifier: "region_table_cell") as! region_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.complete_profile_screen(status: "#01")
        
        /*cell.txt_complete_address.placeholder = text_language.complete_profile_screen(status: "#02")
        cell.txt_area_zipcode.placeholder = text_language.complete_profile_screen(status: "#03")
        cell.txt_gender.placeholder = text_language.complete_profile_screen(status: "#09")
        cell.txt_weight.placeholder = text_language.complete_profile_screen(status: "#10")
        cell.txt_blood_group.placeholder = text_language.complete_profile_screen(status: "#11")
        
        cell.btn_finish.setTitle(text_language.complete_profile_screen(status: "#07"), for: .normal)
        
        cell.btn_finish.addTarget(self, action: #selector(finish_click_method), for: .touchUpInside)
        
        cell.btn_gender.addTarget(self, action: #selector(gender_click_method), for: .touchUpInside)*/
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1100
    }

}


