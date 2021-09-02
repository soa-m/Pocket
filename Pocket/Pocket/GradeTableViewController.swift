//
//  GradeTableViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/09/02.
//

import UIKit

class GradeTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate{

    let gradeList: Array = ["★(一週間後に通知)","★★(四日後に通知)","★★★(二日後に通知)","★★★★(一日後に通知)","★★★★★(3時間後に通知)","★★★★★★(1時間後に通知)","★★★★★★★(1分後に通知(β版))"]
    var  tapped :Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return gradeList.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel!.text = gradeList[indexPath.row]
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
            controller.grade = tapped
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
