//
//  AnnotationDBModel.swift
//  LJL
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit
import Realm

class AnnotationDBModel: RLMObject {
    var latitude: Double?
    var longitude: Double?
    var ljModel: LJObjDBModel?
}
