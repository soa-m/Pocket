//
//  ThirdViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/05/16.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }

    var onButtonTapped: () -> Void = {}
        @IBAction func nextMove(_ sender: Any) {
            onButtonTapped()
        }
    
    @IBAction func closeModal() {
            self.dismiss(animated: true, completion: nil)
        }
    @IBAction func close() {
            self.dismiss(animated: true, completion: nil)
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
