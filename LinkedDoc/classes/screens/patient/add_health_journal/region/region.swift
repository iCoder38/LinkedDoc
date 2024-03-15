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
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = .clear
            tble_view.delegate = self
            tble_view.dataSource = self
            tble_view.separatorColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.tble_view.reloadData()
        
    }
    
    @objc func continue_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! region_table_cell
        
        if (cell.txt_view_one.text == "") {
            return
        }
        if (cell.txt_view_two.text == "") {
            return
        }
        
        let custom_dict = [
            "view_one":String(cell.txt_view_one.text!),
            "view_two":String(cell.txt_view_two.text!),
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_region")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "severity_id") as? severity
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func skip_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! region_table_cell
        
        let custom_dict = [
            "view_one":"",
            "view_two":"",
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_region")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "severity_id") as? severity
        self.navigationController?.pushViewController(push!, animated: true)
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
        
        self.lbl_navigation_title.text = text_language.region_screen(status: "#01")
        
        cell.lbl_pd1.text = text_language.common_screen(status: "please_describe")
        cell.lbl_pd2.text = text_language.common_screen(status: "please_describe")
        
        cell.lbl_where_is.text = text_language.region_screen(status: "#02")
        cell.lbl_is_there.text = text_language.region_screen(status: "#03")
        
        // from on set
        cell.btn_skip.setTitle(text_language.on_set_screen(status: "#04"), for: .normal)
        cell.btn_continue.setTitle(text_language.add_health_journal_screen(status: "#06"), for: .normal)
        
        cell.btn_skip.addTarget(self, action: #selector(skip_click_method), for: .touchUpInside)
        cell.btn_continue.addTarget(self, action: #selector(continue_click_method), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1100
    }

}


