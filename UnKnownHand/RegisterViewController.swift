//
//  RegisterViewController.swift
//  UnKnownHand
//
//  Created by ＣＭＲＤＢ on 2019/6/9.
//  Copyright © 2019 ohfreeya. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var passwd: UITextField!
    @IBOutlet weak var passwd_check: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func register_btn(_ sender: Any) {
        
        if(account.text! != "" && passwd.text! != "" && passwd_check.text! != "") {
            if(passwd.text! == passwd_check.text!) {
                if(Database().register(account: account.text!, password: passwd.text!)) {
                    print(true);
                } else {
                    print(false);
                }
            } else {
                msg.text = "密碼確認錯誤"
            }
        }else{
            msg.text = "欄位不可留白"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
