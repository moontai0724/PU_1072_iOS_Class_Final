//
//  RegisterViewController.swift
//  UnKnownHand
//
//  Created by ＣＭＲＤＢ on 2019/6/9.
//  Copyright © 2019 ohfreeya. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var passwd: UITextField!
    @IBOutlet weak var passwd_check: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func register_btn(_ sender: Any) {
        var Account:String? = nil
        var Password:String? = nil
        Account = account.text!;
        Password = passwd.text!;
        var database : Database!
        if(Account != nil && Password != nil && passwd_check != nil) {
            if(Password == passwd_check.text!) {
                database.Register(Account: Account, Password: Password)
            }
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
