//
//  SolvedListViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/13.
//

import UIKit
import RealmSwift

class SolvedListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate {
    

    let realm = try! Realm()
    var tapped :Int = -1
    @IBOutlet var collectionView: UICollectionView!
    let photos = ["pocket_12","pocket_9","pocket_1","pocket_14","pocket_8","pocket_6","pocket_11","pocket_7","pocket_2","pocket_4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self

        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.collectionViewLayout = layout
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let results = realm.objects(Pocket.self).filter("solved = true").sorted(byKeyPath: "solvedTime", ascending: false)
        return results.count // 表示するセルの数
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録(先程命名した"Cell")
            // Tag番号を使ってImageViewのインスタンス生成
            let imageView = cell.contentView.viewWithTag(1) as! UIImageView
            let label = cell.contentView.viewWithTag(2) as! UILabel
            // 画像配列の番号で指定された要素の名前の画像をUIImageとする
            let results = realm.objects(Pocket.self).filter("solved = true").sorted(byKeyPath: "solvedTime", ascending: false)
            var Images :[String]
            Images = []
            let count = results.count
            for i in 0..<count {
                let color = results[i].color
                let colors = photos[color]
                Images.append(colors)
            }
            
            var Titles :[String]
            Titles = []
            for i in 0..<count {
                let title = results[i].title
                Titles.append(title)
            }
            label.text = Titles[indexPath.row]
            let cellImage = UIImage(named: Images[indexPath.row])
            // UIImageをUIImageViewのimageとして設定
            imageView.image = cellImage
        
            return cell
        }
     
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let horizontalSpace : CGFloat = 20
            let cellSize : CGFloat = self.view.bounds.width / 2 - horizontalSpace
            return CGSize(width: cellSize, height: cellSize)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tapped = indexPath.row
        self.performSegue(withIdentifier: "ToDetail", sender: nil)
    }
    
    func navigationController(_ navigatioinController : UINavigationController, willShow viewController:UIViewController, animated: Bool){

        if let controller = viewController as? SolvedDetailViewController{
            controller.pocketId = tapped

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

