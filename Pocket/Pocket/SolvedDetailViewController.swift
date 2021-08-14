//
//  SolvedDetailViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/13.
//

import UIKit
import RealmSwift

class SolvedDetailViewController: UIViewController,UINavigationControllerDelegate {
    let realm = try! Realm()
    let photos = ["pocket_12","pocket_9","pocket_1","pocket_14","pocket_8","pocket_6","pocket_11","pocket_7","pocket_2","pocket_4"]
    @IBOutlet var image :UIImageView!
    var pocketId :Int = -1
    @IBOutlet var titleLabel  :UILabel!
    @IBOutlet var contentLabel :UILabel!
    @IBOutlet var solutionLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        

        // Do any additional setup after loading the view.
        let results = realm.objects(Pocket.self).filter("solved = true").sorted(byKeyPath: "time", ascending: false)
        let pocketTitle = results[pocketId].title
        let pocketContent = results[pocketId].content
        let pocketImage = results[pocketId].color
        let pocketSolution = results[pocketId].solution
        
        titleLabel.text = pocketTitle
        contentLabel.text = pocketContent
        let images = UIImage(named: photos[pocketImage])
        image.image = images
        
        solutionLabel.text = pocketSolution
    }
    
    
    @IBAction func deletePocket(){
        //新しい順にしたらcount-(マイナス)idにする!!
        let results = realm.objects(Pocket.self).filter("solved = true").sorted(byKeyPath: "time", ascending: false)
        let object = results[pocketId]
        try! realm.write{
            realm.delete(object)
        }
        self.navigationController?.popViewController(animated: true)
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
