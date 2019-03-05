//
//  SearchDB.swift
//  Locations
//
//  Created by  chdo on 2019/3/3.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

class SearchDB: NSObject {

    public class func searchAllLJPoints() -> [LJAnnotaionVM]
    {
        var points = [LJAnnotaionVM]()
        let res = AnnotationDBModel.allObjects()
        for item in 0 ..< res.count {
            if let dbModel = res.object(at: item) as? AnnotationDBModel {
                let vm = LJAnnotaionVM()
                vm.dbModel = dbModel
                points.append(vm)
            }
        }
        return points
    }
    
    public class func save(_ point: LJAnnotaionVM)
    {
        if let dbModel = point.dbModel {
            RLMRealm.default().add(dbModel)
        }
    }
}
