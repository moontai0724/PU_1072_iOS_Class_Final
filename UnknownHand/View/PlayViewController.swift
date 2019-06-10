//
//  PlayViewController.swift
//  UnknownHand
//
//  Created by RRJJ on 2019/6/9.
//  Copyright © 2019 RRJJ. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, UIPickerViewDelegate , UIPickerViewDataSource {
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Paper(_ sender: AnyObject) {
        let index:Int = Int(arc4random() % 3)
        
        pickerView.selectRow(index, inComponent: 0, animated: true)

        var result: String = ""

        if index == 0 {
            result = "平手"
        } else if index == 2 {
            result = "獲勝"
        } else if index == 1 {
            result = "敗北"
        } else {
            alert("錯誤", "未知的 code")
            return
        }

        resultLabel.text = result
        alert("結果", result)
        Database().addHistory(userPunched: 0, systemPunched: Int16(index), result: result)
    }

    @IBAction func Scssiors(_ sender: AnyObject) {
        let index:Int = Int(arc4random() % 3)

        pickerView.selectRow(index, inComponent: 0, animated: true)
        
        var result: String = ""
        
        if index == 1 {
            result = "平手"
        } else if index == 0 {
            result = "獲勝"
        } else if index == 2 {
            result = "敗北"
        } else {
            alert("錯誤", "未知的 code")
            return
        }
        
        resultLabel.text = result
        alert("結果", result)
        Database().addHistory(userPunched: 1, systemPunched: Int16(index), result: result)
    }

    @IBAction func Stone(_ sender: AnyObject) {
        let index:Int = Int(arc4random() % 3)
        
        pickerView.selectRow(index, inComponent: 0, animated: true)
        
        var result: String = ""
        
        if index == 2 {
            result = "平手"
        } else if index == 1 {
            result = "獲勝"
        } else if index == 0 {
            result = "敗北"
        } else {
            alert("錯誤", "未知的 code")
            return
        }
        
        resultLabel.text = result
        alert("結果", result)
        Database().addHistory(userPunched: 2, systemPunched: Int16(index), result: result)
    }

    @IBAction func history(_ sender: Any) {
        let history: UIViewController = UIStoryboard(name: "History", bundle: nil).instantiateViewController(withIdentifier: "History")
        navigationController?.pushViewController(history, animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        if Database().logout() {
            let Login: UIViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login")
            present(Login, animated: true, completion: nil)
        } else {
            alert("錯誤", "登出時發生錯誤")
        }
    }

    func alert(_ title: String, _ message: String) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert);
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "確認", style: .default)
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok);
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil);
    }
}

extension PlayViewController {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK:UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 107.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 155.0
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let punchType = ["paper", "scissors", "stone"];
        let imageView = UIImageView()
        imageView.image = UIImage(named: punchType[row])
        return imageView
    }
}

