//
//  ViewController.swift
//  UnKnownHand
//
//  Created by ohfreeya on 2019/6/8.
//  Copyright © 2019年 ohfreeya. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UIApplicationDelegate{
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let UserRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    let HistoryRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
    
    var online : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*Register(UserID: 123, Password: "123")
        Login(UserID: 123, Password: "123")
        Exit()
        
        AddHistory(punchedR: 0, punchedY: 1, id: 123,thewin: "computer")
        getAll()*///測試用
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //////  core data
    func Login(UserID:Int32 ,Password:String){ //登入認證
        if(online){
            print("online now");//into main page
        }
        else{
            do{
                var count:Int = 0
                let Userlogin = try context.fetch(UserRequest) as! [User] //抓資料
                for i in Userlogin{
                    if(UserID == i.id){  //比較是否有帳號
                        if(Password == i.password){  //比較密碼是否正確
                            count = 1
                            print("suceed")
                        }
                        else{
                            print("password error")
                            count = 1
                        }
                    }
                }
                if(count == 0){
                    print("account error")
                }
            }catch{
                
            }
        }
    }
    func Exit(){ //登出
        online = false
    }
    func Register(UserID:Int32,Password:String){//註冊帳號
        do{
            let AllData1 = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User  //
            let AllData = try context.fetch(UserRequest) as! [User] //所有資料
            var isRegister : Bool = false
            for data in AllData{
                if(data.id == UserID){ //若帳號存在
                    isRegister = true
                    break;
                }
            }
            if(!isRegister){
                AllData1.id = UserID
                AllData1.password = Password
                try context.save()
                print("register succed")
            }
        }
        catch{
            
        }
    }
   
    func AddHistory(punchedR:Int16,punchedY:Int16,id:Int32,thewin: String){//  新增對戰紀錄
        if(online == true){
            do{
                let data = NSEntityDescription.insertNewObject(forEntityName: "History", into: context) as! History //抓資料
                data.id = id // 玩家ＩＤ
                data.rival = punchedR
                data.punched = punchedY
                data.thewin = thewin
                try context.save()
                print("add succed")
            }catch{print("add fail")}
        }
    }
    func getAll(){ // 顯示所有對戰紀錄
        if(online == true){
            do{
                let getData = try context.fetch(HistoryRequest) as! [History] //抓資料
                for result in getData{
                    print((result.id),(result.punched), result.rival ,result.thewin) //印所有資料 1 win 0 lose
                }
            }catch{}
        }
    }

}

