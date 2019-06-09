//
//  ViewController.swift
//  UnknowHand
//
//  Created by 蔡易錡 on 2019/6/8.
//  Copyright © 2019 蔡易錡. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var registerbtn: UIButton!
    @IBOutlet weak var info: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginbtn.layer.cornerRadius = 10
        registerbtn.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login(_ sender: Any) {
        if Database().login(account: account.text!, password: password.text!){
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView")
            
            present(viewController, animated: true, completion: nil)
        }else{
            self.info.text = "帳號或密碼錯誤！"
        }
    }
    

}

