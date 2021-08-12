//
//  pocket.swift
//  Pocket
//
//  Created by 松村奏和 on 2021/08/12.
//

import Foundation
import RealmSwift

class Pocket: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var subject: String = ""
    @objc dynamic var color: Int = 0
}
