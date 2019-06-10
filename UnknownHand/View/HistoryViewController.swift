//
//  HistoryViewController.swift
//  UnknownHand
//
//  Created by moontai0724 on 2019/6/10.
//  Copyright © 2019 moontai0724. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var historyTableView: UITableView!
    var histories = Database().getHistories();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let punch = ["剪刀", "石頭", "布"];
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "cell") as! historyCell

        let history = histories[histories.count - indexPath.row - 1]
        cell.id!.text = String(history.id)
        cell.userPunched!.text = punch[Int(history.userPunched)]
        cell.systemPunched!.text = punch[Int(history.systemPunched)]
        cell.result!.text = history.result
        return cell;
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if(Database().removeHistory(id: histories[histories.count - 1 - indexPath.row].id)) {
                self.histories.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    @IBAction func logout(_ sender: UIButton) {
        if Database().logout() {
            let Login: UIViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login")
            present(Login, animated: true, completion: nil)
        } else {
            errorAlert("登出時發生錯誤");
        }
    }
    
    func errorAlert(_ message: String) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert);

        // Create OK button with action handler
        let ok = UIAlertAction(title: "確認", style: .default)

        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)

        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil);
    }
}

public class historyCell: UITableViewCell {
    @IBOutlet var id: UILabel!
    @IBOutlet var userPunched: UILabel!
    @IBOutlet var systemPunched: UILabel!
    @IBOutlet var result: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}
