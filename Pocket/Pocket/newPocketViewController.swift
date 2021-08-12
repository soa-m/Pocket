//
//  newPocketViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import UIKit

class newPocketViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    var var1 :String!
    

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
