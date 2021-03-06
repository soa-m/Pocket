//
//  pocket.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import Foundation
import RealmSwift

class Pocket: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var subject: Int = -1
    @objc dynamic var color: Int = -1
    @objc dynamic var grade: Int = -1
    @objc dynamic var time: Date = Date()
    @objc dynamic var solvedTime: Date = Date()
    @objc dynamic var solved: Bool = false
    @objc dynamic var solution: String = ""
    
    //Primary Keyの設定
        override static func primaryKey() -> String? {
            return "id"
        }
}
