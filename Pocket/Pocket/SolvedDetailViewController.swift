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
    let dataList: Array = ["国語","数学", "理科","社会","哲学","体育","音楽","技術","アイデア","その他"]
    let gradeList: Array = ["★","★★","★★★","★★★★","★★★★★","★★★★★★","★★★★★★★"]
    @IBOutlet var image :UIImageView!
    var pocketId :Int = -1
    @IBOutlet var titleLabel  :UILabel!
    @IBOutlet var contentLabel :UILabel!
    @IBOutlet var solutionLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        

        // Do any additional setup after loading the view.
        let results = realm.objects(Pocket.self).filter("solved = true").sorted(byKeyPath: "time", ascending: false)
        let pocketTitle = results[pocketId].title
        let pocketContent = results[pocketId].content
        let pocketSubject = results[pocketId].subject
        let pocketImage = results[pocketId].color
        let pocketSolution = results[pocketId].solution
        let pocketGrade = results[pocketId].grade
        
        titleLabel.text = pocketTitle
        contentLabel.text = pocketContent
        let images = UIImage(named: photos[pocketImage])
        image.image = images
        
        subjectLabel.text = dataList[pocketSubject]
        gradeLabel.text = gradeList[pocketGrade]
        
        solutionLabel.text = pocketSolution
        titleLabel.font = UIFont(name:"Mamelon-5-Hi-Regular", size: 34.0)
        contentLabel.font = UIFont(name:"Mamelon-5-Hi-Regular", size: 20.0)
        solutionLabel.font = UIFont(name:"Mamelon-5-Hi-Regular", size: 20.0)
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
