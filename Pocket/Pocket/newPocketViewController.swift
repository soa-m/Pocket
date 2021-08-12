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
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextField: UITextField!
    
    @IBOutlet var label: UILabel!
    var var1 :String!
    
    @IBAction func save(){
        let now: Date = Date()
        let title: String = titleTextField.text!
        let content: String = contentTextField.text!
        let subject: String = label.text ?? ""
        
            let newPocket = Pocket()
        newPocket.title = title
        newPocket.content = content
        newPocket.time = now
        newPocket.subject = subject
            
            try! realm.write {
                realm.add(newPocket)
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "選択してください"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        if let var1 = var1{
        label.text = var1
        print(var1)
        }
        print("var1はnil！！")
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
