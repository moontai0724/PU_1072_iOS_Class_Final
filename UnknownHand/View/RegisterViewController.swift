//
//  RegisterViewController.swift
//  UnknownHand
//
//  Created by 莊英祺 on 2019/6/9.
//  Copyright © 2019 ohfreeya. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var password_check: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        account.clearButtonMode = .whileEditing
        password.clearButtonMode = .whileEditing
        password_check.clearButtonMode = .whileEditing
        // Do any additional setup after loading the view.
    }

    @IBAction func register(_ sender: Any) {
        if(account.text! != "" && password.text! != "" && password_check.text! != "") {
            if(password.text! == password_check.text!) {
                if(Database().register(account: account.text!, password: password.text!)) {
                    successAlert("註冊成功")
                } else {
                    errorAlert("註冊失敗")
                }
            } else {
                errorAlert("密碼確認錯誤")
            }
        } else {
            errorAlert("欄位不可留白")
        }
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
    }
    
    func successAlert(_ message: String) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "成功", message: message, preferredStyle: .alert);
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "確認", style: .default) { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok);
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil);
    }
    
    func errorAlert(_ message: String) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert);
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "確認", style: .default)
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok);
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil);
    }
}
