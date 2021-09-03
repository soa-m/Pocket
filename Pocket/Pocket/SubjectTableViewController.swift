//
//  SubjectTableViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import UIKit

class SubjectTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
    var  tapped :Int = -1
    let dataList: Array = ["国語","数学", "理科","社会","哲学","体育","音楽","技術","アイデア","その他"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataList.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel!.text = dataList[indexPath.row]
            return cell
        }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tapped = indexPath.row
    }
        



    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func navigationController(_ navigatioinController : UINavigationController, willShow viewController:UIViewController, animated: Bool){
        
        if let controller = viewController as? newPocketViewController{
            controller.subject = tapped
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
