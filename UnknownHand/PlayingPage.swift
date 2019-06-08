//
//  PlayingPage.swift
//  UnKnownHand
//
//  Created by csim on 2019/6/9.
//  Copyright © 2019年 ohfreeya. All rights reserved.
//

import UIKit

class PlayingPage: UIViewController {
    
    
    //剪刀＝０，石頭＝１，布＝２
    @IBOutlet weak var xx: UIButton!
    @IBOutlet weak var oo: UIButton!
    @IBOutlet weak var SS: UIButton!
    @IBOutlet weak var pview: UIPickerView!
    
    
    @IBOutlet weak var result: UILabel!
    let main = ViewController()
    let imaArr = [#imageLiteral(resourceName: "sss.jpg"),#imageLiteral(resourceName: "images.jpg"),#imageLiteral(resourceName: "ima.jpg") ]
    var data = Array<Int>()
    var bounds: CGRect = CGRect.zero
    override func viewDidLoad() {
        super.viewDidLoad()
        pview.delegate = self
        pview.dataSource = self
        
        for _ in 1...100 {
            self.data.append((Int)(arc4random() % 3))
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    //布
    @IBAction func XX(_ sender: AnyObject) {
        var index:Int = Int(arc4random() % 100)
        
        func call(){
            pview.selectRow(index, inComponent: 0, animated: true)
            if imaArr[data[pview.selectedRow(inComponent: 0)]] ==  #imageLiteral(resourceName: "ima.jpg") {
                result.text = "平手"
            }
            else if imaArr[data[pview.selectedRow(inComponent: 0)]] ==  #imageLiteral(resourceName: "images.jpg") {
                result.text = "你贏了"
            }
            else{
                result.text = "你輸了"
            }
           // main.AddHistory(punchedR: <#T##Int16#>, punchedY: <#T##Int16#>, id: <#T##Int32#>, thewin: <#T##String#>)
            
        }
        
        oo.isHidden = true
        oo.isEnabled = false
        SS.isHidden = true
        SS.isEnabled = false
        call()
        
        
        
        
        
    }
    //石頭
    @IBAction func OO(_ sender: AnyObject) {
        var index:Int = Int(arc4random() % 100)
        
        func call(){
            pview.selectRow(index, inComponent: 0, animated: true)
            if imaArr[data[pview.selectedRow(inComponent: 0)]] ==  #imageLiteral(resourceName: "images.jpg") {
                result.text = "平手"
            }
            else if imaArr[data[pview.selectedRow(inComponent: 0)]] ==  #imageLiteral(resourceName: "sss.jpg"){
                result.text = "你贏了"
            }
            else{
                result.text = "你輸了"
            }
        }
        
        xx.isHidden = true
        xx.isEnabled = false
        SS.isHidden = true
        SS.isEnabled = false
        call()
    }
    //剪刀
    @IBAction func s(_ sender: AnyObject) {
        var index:Int = Int(arc4random() % 100)
        
        func call(){
            pview.selectRow(index, inComponent: 0, animated: true)
            if imaArr[data[pview.selectedRow(inComponent: 0)]] ==  #imageLiteral(resourceName: "sss.jpg") {
                result.text = "平手"
            }
            else if imaArr[data[pview.selectedRow(inComponent: 0)]] ==  #imageLiteral(resourceName: "ima.jpg") {
                result.text = "你贏了"
            }
            else{
                result.text = "你輸了"
            }
        }
        
        oo.isHidden = true
        oo.isEnabled = false
        xx.isHidden = true
        xx.isEnabled = false
        call()
    }
    
    @IBAction func reset(_ sender: AnyObject) {
        oo.isHidden = false
        oo.isEnabled = true
        SS.isHidden = false
        SS.isEnabled = true
        xx.isHidden = false
        xx.isEnabled = true
        result.text = "比賽結果"
    }
    
    
}
extension PlayingPage : UIPickerViewDelegate , UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK:UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let picker = UIImageView()
        
        if component == 0{
            picker.image = imaArr[data[row]]
        }
        
        
        
        return picker
    }
}
