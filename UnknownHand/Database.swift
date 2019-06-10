//
//  Database.swift
//  UnknownHand
//
//  Created by ohfreeya on 2019/6/8.
//  Copyright © 2019 ohfreeya. All rights reserved.
//

import UIKit
import CoreData

class Database: UIViewController {
    var db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let UserRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    let HistoryRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "History")

    func login(account: String, password: String) -> Bool {
        do {
            let users = try db.fetch(UserRequest) as! [User]
            for user in users {
                if(user.account == account) {
                    if(user.password == password) {
                        user.isLogin = true;
                        try db.save()
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
        if(self.onlineAccount() != nil) {
            do {
                let users = try db.fetch(UserRequest) as! [User]
                for user in users {
                    if(user.account == self.onlineAccount()) {
                        user.isLogin = false;
                        print("Logout: Logout success");
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
            print("Register: Account \(account) create success");
            return true;
        } catch {
            print("Register: An unexpected error occerred");
            return false;
        }
    }

    func checkLogin() -> Bool {
        do {
            let users = try db.fetch(UserRequest) as! [User]
            for user in users {
                if(user.isLogin == true) {
                    print("checkLogin: \(user.account!) is already logged in");
                    return true;
                }
            }
            print("checkLogin: No user is logged in");
            return false;
        } catch {
            print("checkLogin: An unexpected error occerred");
            return false;
        }
    }

    func onlineAccount() -> String? {
        do {
            let users = try db.fetch(UserRequest) as! [User]
            for user in users {
                if(user.isLogin == true) {
                    print("onlineAccount: \(user.account!)");
                    return user.account;
                }
            }
            print("onlineAccount: No user is logged in");
            return nil;
        } catch {
            print("onlineAccount: An unexpected error occerred");
            return nil;
        }
    }

    func addHistory(userPunched:Int16, systemPunched:Int16, result: String) -> Bool {
        if(self.onlineAccount() != nil) {
            do {
                let histories = try db.fetch(HistoryRequest) as! [History]
                let data = NSEntityDescription.insertNewObject(forEntityName: "History", into: db) as! History // 抓資料
                data.id = histories.count < 1 ? 0 : Int32(histories[histories.count - 1].id + 1)
                data.account = self.onlineAccount()
                data.userPunched = userPunched
                data.systemPunched = systemPunched
                data.result = result
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
        if(self.onlineAccount() != nil) {
            do {
                let histories = try db.fetch(HistoryRequest) as! [History] //抓資料
                var userHistories: Array<History> = []
                for history in histories {
                    if(history.account == self.onlineAccount()) {
                        userHistories.append(history)
                    }
                }
                return userHistories
            } catch {
                print("getHistories: An unexpected error occerred")
                return []
            }
        } else {
            print("getHistories: Not logged in")
            return []
        }
    }

    func removeHistory(id: Int32) -> Bool {
        if(self.onlineAccount() != nil) {
            do {
                let histories = try db.fetch(HistoryRequest) as! [History] //抓資料
                for history in histories {
                    if(history.id == id) {
                        db.delete(history)
                        try db.save()
                        print("removeHistory: Removed history which id = \(id)")
                        return true
                    }
                }
                return false
            } catch {
                print("removeHistory: An unexpected error occerred")
                return false
            }
        } else {
            print("removeHistory: Not logged in")
            return false
        }
    }
}
