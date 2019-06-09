//
//  Database.swift
//  UnKnownHand
//
//  Created by moontai0724 on 2019/6/9.
//  Copyright © 2019 ohfreeya. All rights reserved.
//

import UIKit
import CoreData

class Database: UIViewController, UIApplicationDelegate {
    var db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let UserRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    let HistoryRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "History")

    var onlineAccount: String?

    func login(account: String, password: String) -> Bool {
        do {
            let users = try db.fetch(UserRequest) as! [User]
            for user in users {
                if(user.account == account) {
                    if(user.password == password) {
                        user.isLogin = true;
                        print("Login: Login success");
                        return true;
                    } else {
                        print("Login: Password error");
                        return false;
                    }
                }
            }
            print("Login: No account matched.");
            return false;
        } catch {
            print("Login: An unexpected error occerred");
            return false;
        }
    }

    func logout() -> Bool {
        if(onlineAccount != nil) {
            do {
                let users = try db.fetch(UserRequest) as! [User]
                for user in users {
                    if(user.account == onlineAccount) {
                        user.isLogin = false;
                        onlineAccount = nil
                        print("Logout: Login success");
                        return true;
                    }
                }
                print("Logout: No account matched.");
                return false;
            } catch {
                print("Logout: An unexpected error occerred");
                return false;
            }
        } else {
            print("Logout: Not logged in");
            return false;
        }
    }

    func register(account: String, password:String) -> Bool {
        do {
            let targetTable = NSEntityDescription.insertNewObject(forEntityName: "User", into: db) as! User
            let users = try db.fetch(UserRequest) as! [User]
            for user in users {
                if(user.account == account) {
                    print("Register: Account already exists");
                    return false;
                }
            }
            targetTable.account = account
            targetTable.password = password
            try db.save()
            return true;
        } catch {
            print("Register: An unexpected error occerred");
            return false;
        }
    }

    func addHistory(userPunched:Int16, computerPunched:Int16, userWin: Bool) -> Bool {
        if(onlineAccount != nil) {
            do {
                let histories = try db.fetch(HistoryRequest) as! [History]
                let data = NSEntityDescription.insertNewObject(forEntityName: "History", into: db) as! History // 抓資料
                data.id = Int32(histories[histories.count - 1].id + 1)
                data.account = onlineAccount
                data.punched = userPunched
                data.rival = computerPunched
                data.userWin = userWin
                try db.save()
                print("addHistory: Add history success")
                return true
            } catch {
                print("addHistory: An unexpected error occerred")
                return false
            }
        } else {
            print("addHistory: Not logged in")
            return false
        }
    }

    func getHistories() -> [History] {
        if(onlineAccount != nil) {
            do {
                let histories = try db.fetch(HistoryRequest) as! [History] //抓資料
                var userHistories: Array<History> = []
                for history in histories {
                    if(history.account == onlineAccount) {
                        userHistories.append(history)
                    }
                }
                return histories
                // print(history.account, history.punched, history.rival, history.userWin)
            } catch {
                print("getHistories: An unexpected error occerred")
                return []
            }
        } else {
            print("getHistories: Not logged in")
            return []
        }
    }
    
}

