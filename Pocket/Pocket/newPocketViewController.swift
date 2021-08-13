//
//  newPocketViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import UIKit
import RealmSwift

class newPocketViewController: UIViewController,UITextFieldDelegate {
    
    let realm = try! Realm()
    let dataList: Array = ["国語","数学", "理科","社会","哲学","体育","音楽","技術","アイデア","その他"]
    let colorList: Array = ["白","赤","青","黄","紫","ピンク","紺","緑","オレンジ","水色"]
    
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    var subject :Int! = -1
    var color :Int! = -1
    
    @IBAction func save(){
        let now: Date = Date()
        let title: String = titleTextField.text!
        let content: String = contentTextField.text!
        
        let newPocket = Pocket()
        newPocket.title = title
        newPocket.content = content
        newPocket.time = now
        newPocket.subject = subject
        newPocket.color = color
        
        if subject != -1 && color != -1 && title != "" && content != ""{
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
