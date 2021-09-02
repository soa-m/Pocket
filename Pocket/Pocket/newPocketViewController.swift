//
//  newPocketViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import UIKit
import RealmSwift
import UserNotifications

class newPocketViewController: UIViewController,UITextFieldDelegate {
    
    let realm = try! Realm()
    let dataList: Array = ["国語","数学", "理科","社会","哲学","体育","音楽","技術","アイデア","その他"]
    let colorList: Array = ["白","赤","青","黄","紫","ピンク","紺","緑","オレンジ","水色"]
    let gradeList: Array = ["★","★★","★★★","★★★★","★★★★★","★★★★★★","★★★★★★★"]
    let timeList: Array = [604800,345600,172800,86400,10800,3600,60]
    var swi: Int = 0
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    var subject :Int! = -1
    var color :Int! = -1
    var grade :Int! = -1
    
    @IBAction func save(){
        let count = realm.objects(Pocket.self).count
        let now: Date = Date()
        let title: String = titleTextField.text!
        let content: String = contentTextField.text!
        print(count)
        let newPocket = Pocket()
        newPocket.id = count + 1
        newPocket.title = title
        newPocket.content = content
        newPocket.time = now
        newPocket.subject = subject
        newPocket.grade = grade
        newPocket.color = color
        
        if subject != -1 && color != -1 && grade != -1 && title != "" && content != ""{
            try! realm.write {
                realm.add(newPocket)
            }
        
        let alert: UIAlertController = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title:"OK", style: .default, handler: nil)
        )
        present(alert, animated: true, completion: nil)
        loadView()
        viewDidLoad()
        }
        let alert: UIAlertController = UIAlertController(title: "失敗", message: "全ての項目を入力してください", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title:"OK", style: .default, handler: nil)
        )
        present(alert, animated: true, completion: nil)
        subject = -1
        color = -1
        if swi == 0{
        setNtf(self)
        }else{
        setNtf2(self)
        }
        loadView()
        viewDidLoad()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "選択してください"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if subject == -1{
            label.text = "選択してください"
        }else{
            label.text = dataList[subject]
        }
        
        if color == -1{
            label2.text = "選択してください"
        }else{
            label2.text = colorList[color]
        }
        
        if grade == -1{
            label3.text = "選択してください"
        }else{
            label3.text = gradeList[grade]
        }
    }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // キーボードを閉じる
            textField.resignFirstResponder()
            return true
        }
    
    @IBAction func testUISwitch(sender: UISwitch) {
        if ( sender.isOn ) {
                swi = 1
            } else {
                swi = 0
            }
        }
    
    func setNtf(_ sender: Any) {
        let count = realm.objects(Pocket.self).count
        let find = count - 1
        let obj = realm.objects(Pocket.self)
        let con = UNMutableNotificationContent()
        let title: String = obj[find].title
        let content: String = obj[find].content
        print(count)
        con.title = title
        con.body = content
        con.sound = UNNotificationSound.default
        print(title)
        print(content)
        let time: Int = timeList[grade]
        let trigger: UNNotificationTrigger
        
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time), repeats: false)
        let request = UNNotificationRequest(identifier: String(count),content: con,trigger: trigger)
        // 通知の登録
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    
    func setNtf2(_ sender: Any) {
        let count = realm.objects(Pocket.self).count
        let find = count - 1
        let obj = realm.objects(Pocket.self)
        let con = UNMutableNotificationContent()
        let title: String = obj[find].title
        let content: String = obj[find].content
        print(count)
        con.title = title
        con.body = content
        con.sound = UNNotificationSound.default
        print(title)
        print(content)
        let time: Int = timeList[grade]
        let trigger: UNNotificationTrigger
        
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time), repeats: true)
        let request = UNNotificationRequest(identifier: String(count),content: con,trigger: trigger)
        // 通知の登録
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
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
