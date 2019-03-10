//
//  AnnotationDBModel.swift
//  LJL
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class AnnotationDBModel: Object {
     @objc var latitude: Double = 0
     @objc var longitude: Double = 0
     var tags:List <String> = List <String>()
     @objc var ljModel: LJObjDBModel?
}
