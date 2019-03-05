//
//  LJAnnotaionVM.swift
//  LJL
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

class LJAnnotaionVM: MAPointAnnotation {
    
    var apiModel : AMapPOI?
    {
        willSet {
            if let new = newValue {
                coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(new.location?.latitude  ?? 0),
                                                        CLLocationDegrees(new.location?.longitude ?? 0))
            }
        }
    }
    
    var dbModel : AnnotationDBModel?
    {
        willSet {
            if let new = newValue {
                coordinate = CLLocationCoordinate2DMake(new.latitude ?? 0, new.latitude ?? 0)
            }
        }
    }
}
