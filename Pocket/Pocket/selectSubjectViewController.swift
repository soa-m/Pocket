//
//  selectSubjectViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import UIKit

class selectSubjectViewController: UIViewController {
    
    var subject: String = ""
    

    @IBAction func tap1(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "国語"
        vc.var1 = subject
    }
    
    @IBAction func tap2(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "数学"
        vc.var1 = subject
    }
    
    @IBAction func tap3(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "理科"
        vc.var1 = subject
    }
    
    @IBAction func tap4(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "社会"
        vc.var1 = subject
    }
    
    @IBAction func tap5(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "哲学"
        vc.var1 = subject
    }
    
    @IBAction func tap6(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "体育"
        vc.var1 = subject
    }
    
    @IBAction func tap7(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "技術"
        vc.var1 = subject
    }
    
    @IBAction func tap8(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "アイデア"
        vc.var1 = subject
    }
    
    @IBAction func tap9(){
        let vc = self.presentingViewController as! newPocketViewController
        subject = "その他"
        vc.var1 = subject
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
