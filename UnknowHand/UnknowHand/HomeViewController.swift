//
//  HomeViewController.swift
//  UnknowHand
//
//  Created by 蔡易錡 on 2019/6/9.
//  Copyright © 2019 蔡易錡. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoutbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutbtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logout", sender: self)
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
