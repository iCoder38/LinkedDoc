//
//  add_health_journal.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit
import Alamofire

class add_health_journal: UIViewController {

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
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.add_health_journal_screen(status: "#01")
        
        /*let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "actions_id") as? actions
        self.navigationController?.pushViewController(push!, animated: true)*/
    }
    
    
    @objc func notable_events_click_method() {
        
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! add_health_journal_table_cell
        
        let dummyList = [text_language.common_screen(status: "pain"), text_language.common_screen(status: "diff_breathing")]
        
        RPicker.selectOption(title: text_language.add_health_journal_screen(status: "#05"), cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
             
            cell.txt_notable_event.text = String(selctedText)
        }
        
    }
    
    @objc func continue_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! add_health_journal_table_cell
        
        /*if (cell.txt_BP.text == "") {
            return
        }
        if (cell.txt_weight.text == "") {
            return
        }
        if (cell.txt_minute_of_excercise.text == "") {
            return
        }
        if (cell.txt_notable_event.text == "") {
            return
        }*/
        
        let custom_dict = [
            "BP":String(cell.txt_BP.text!),
            "weight":String(cell.txt_weight.text!),
            "exercise_time":String(cell.txt_minute_of_excercise.text!),
            "notable_event":String(cell.txt_notable_event.text!)
        ]
        print(custom_dict as Any)
        
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_add_health_journal")
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "onset_id") as? onset
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func skip_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! add_health_journal_table_cell
        
        let custom_dict = [
            "BP":String(cell.txt_BP.text!),
            "weight":String(cell.txt_weight.text!),
            "exercise_time":String(cell.txt_minute_of_excercise.text!),
            "notable_event":String(cell.txt_notable_event.text!)
        ]
        print(custom_dict as Any)
        
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_add_health_journal")
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "onset_id") as? onset
        self.navigationController?.pushViewController(push!, animated: true)
    }
}


//MARK:- TABLE VIEW -
extension add_health_journal: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:add_health_journal_table_cell = tableView.dequeueReusableCell(withIdentifier: "add_health_journal_table_cell") as! add_health_journal_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.lbl_blood_pressure.text = text_language.add_health_journal_screen(status: "#02")
        cell.txt_BP.placeholder = text_language.add_health_journal_screen(status: "#02")
        
        cell.lbl_weight.text = text_language.add_health_journal_screen(status: "#03")
        cell.txt_weight.placeholder = text_language.add_health_journal_screen(status: "#03")
        
        cell.lbl_minute_of_excercise.text = text_language.add_health_journal_screen(status: "#04")
        cell.txt_minute_of_excercise.placeholder = text_language.add_health_journal_screen(status: "#04")
        
        cell.lbl_notable_events.text = text_language.add_health_journal_screen(status: "#05")
        cell.txt_notable_event.placeholder = text_language.add_health_journal_screen(status: "#05")
        
        cell.btn_continue.setTitle(text_language.add_health_journal_screen(status: "#06"), for: .normal)
        
        cell.btn_notable_event.addTarget(self, action: #selector(notable_events_click_method), for: .touchUpInside)
        cell.btn_continue.addTarget(self, action: #selector(continue_click_method), for: .touchUpInside)
        
        cell.btn_skip.addTarget(self, action: #selector(skip_click_method), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1100
    }

}
