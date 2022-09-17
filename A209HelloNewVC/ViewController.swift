//
//  ViewController.swift
//  A209HelloNewVC
//
//  Created by shengyuan on 2022/9/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    let dateFormater = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormater.dateFormat = "yyyy-MMM-dd HH:mm"
        dateFormater.locale = Locale(identifier: "zh_Hant_TW")
        let userDefault = UserDefaults.standard
        if let theDate = userDefault.value(forKey: "lastInputtDate")as? Date{
            display.text = dateFormater.string(from: theDate)
        }
    }
    @IBAction func dateSelectedAction(_ sender: UIDatePicker){
        let theDate = sender.date
        display.text = dateFormater.string(from: theDate)
        let userDefault = UserDefaults.standard
        userDefault.set(theDate, forKey: "lastInputDate")
        userDefault.synchronize()
    }

}
