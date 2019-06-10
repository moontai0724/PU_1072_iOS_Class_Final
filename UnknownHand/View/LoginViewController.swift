//
//  LoginViewController.swift
//  UnknownHand
//
//  Created by 蔡易錡 on 2019/6/8.
//  Copyright © 2019 蔡易錡. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 10
        registerBtn.layer.cornerRadius = 10
        account.clearButtonMode = .whileEditing
        password.clearButtonMode = .whileEditing
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Database().checkLogin() {
            print("Already logged in, change page.");
            let viewController:UIViewController = UIStoryboard(name: "Play", bundle: nil).instantiateViewController(withIdentifier: "Play")
            present(viewController, animated: true, completion: nil)
        }
    }

    @IBAction func register(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "Register")
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        if Database().login(account: account.text!, password: password.text!) {
            let viewController:UIViewController = UIStoryboard(name: "Play", bundle: nil).instantiateViewController(withIdentifier: "Play")
            present(viewController, animated: true, completion: nil)
        } else {
            errorAlert("帳號或密碼錯誤！")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view?.endEditing(true)
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
