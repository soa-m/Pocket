//
//  SamplePieprogViewController.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/14.
//


import UIKit
import RealmSwift

class SamplePieprogViewController: UIViewController {
    
    
    let realm = try! Realm()
    let mainLayer = CAShapeLayer()
    let progressLabel = UILabel()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let contentLabel2 = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let results = realm.objects(Pocket.self)
        let all = results.count
        let solved = results.filter("solved = true")
        let solvedCount = solved.count
        var value: Int = 0
        if solvedCount != 0{
        value = 100*solvedCount/all
        }else{
        value = 0
        }
        // スライダーが変更されたときに呼び出されるメソッドの設定
//        progressSlider.addTarget(self, action: #selector(changeProgressSlider), for: UIControl.Event.valueChanged)
//        self.view.addSubview(progressSlider)
        
        // UILabelの生成
        titleLabel.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 120, width: 200, height: 30)
        titleLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        titleLabel.font = UIFont(name: "HiraKakuProN-W6", size: 18)
        titleLabel.textAlignment = .center
        titleLabel.text = "全体の進捗"
        self.view.addSubview(titleLabel)

        // 円形バーのバックビューの作成
        let backView = UIView()
        backView.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 180, width: 200, height: 200)
        backView.backgroundColor = UIColor.white
        self.view.addSubview(backView)
        
        let backPath = UIBezierPath()
        backPath.addArc(withCenter: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: .pi * 2.0, clockwise: true)
        let backLayer = CAShapeLayer()
        backLayer.path = backPath.cgPath
        backLayer.fillColor = UIColor.clear.cgColor
        backLayer.strokeColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0).cgColor
        backLayer.lineWidth = 50.0
        backView.layer.addSublayer(backLayer)
        
        let startPath = UIBezierPath()
        if solvedCount != 0{
        startPath.addArc(withCenter: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: CGFloat(3.6 * Double(value) * .pi / 180), clockwise: true)
        }else{
            startPath.addArc(withCenter: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: CGFloat(0), clockwise: true)
        }
        mainLayer.path = startPath.cgPath
        mainLayer.fillColor = UIColor.clear.cgColor
        mainLayer.strokeColor = UIColor(red: 1.00, green: 0.22, blue: 0.38, alpha: 1.0).cgColor
        mainLayer.lineWidth = 50.0
        backView.layer.addSublayer(mainLayer)
        
        // backViewを-90度回転する
        let angle:CGFloat = -.pi/2
        backView.transform = CGAffineTransform(rotationAngle: angle)
        
        // UILabelの生成
        progressLabel.frame = CGRect(x: UIScreen.main.bounds.size.width/2-50, y: 265, width: 100, height: 30)
        progressLabel.textColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.0)
        progressLabel.font = UIFont(name: "HiraKakuProN-W3", size: 24)
        progressLabel.textAlignment = .right
        self.view.addSubview(progressLabel)
        if solvedCount != 0{
        progressLabel.text = String(format: "%.01f", Float(value)) + " %"
        }else{
        progressLabel.text = "0%"
        }
        
        // UILabelの生成
        progressLabel.frame = CGRect(x: UIScreen.main.bounds.size.width/2-50, y: 265, width: 100, height: 30)
        progressLabel.textColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.0)
        progressLabel.font = UIFont(name: "HiraKakuProN-W3", size: 24)
        progressLabel.textAlignment = .right
        self.view.addSubview(progressLabel)
        if solvedCount != 0{
        progressLabel.text = String(format: "%.01f", Float(value)) + " %"
        }else{
        progressLabel.text = "0%"
        }
        
        // UILabelの生成
        contentLabel.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 500, width: 200, height: 30)
        contentLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        contentLabel.font = UIFont(name: "HiraKakuProN-W6", size: 14)
        contentLabel.textAlignment = .center

        self.view.addSubview(contentLabel)
        contentLabel.text = "全てのポケットの数は" + String(all)
        
        contentLabel2.frame = CGRect(x: UIScreen.main.bounds.size.width/2-100, y: 550, width: 200, height: 30)
        contentLabel2.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        contentLabel2.font = UIFont(name: "HiraKakuProN-W6", size: 14)
        contentLabel2.textAlignment = .center

        self.view.addSubview(contentLabel2)
        contentLabel2.text = "解決済みポケットの数は" + String(solvedCount)
    }
    

    // スライダーが変更されたときに呼ばれる処理
//    @objc func changeProgressSlider(_ sender: UISlider) {
//        let changePath = UIBezierPath()
//        changePath.addArc(withCenter: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: CGFloat(3.6 * sender.value * .pi / 180), clockwise: true)
//        mainLayer.path = changePath.cgPath
//        progressLabel.text = String(format: "%.01f", Float(sender.value)) + " %"
//    }

}
