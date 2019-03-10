//
//  SearchDB.swift
//  Locations
//
//  Created by  chdo on 2019/3/3.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit
import RealmSwift

class DBService: NSObject {
    
    static var realm: Realm?
    
    static func configDB(){
        do {
            try realm = Realm()
        } catch {
            print("realm 出错了: \(error).")
        }
        print("realm地址:\(realm!.configuration.fileURL!)")
    }

    public class func searchAllLJPoints() -> [LJAnnotaionVM]
    {
        var points = [LJAnnotaionVM]()
        let res = realm!.objects(AnnotationDBModel.self)
        for item in 0 ..< res.count {
            let vm = LJAnnotaionVM()
            vm.dbModel = res[item]
            points.append(vm)
        }
        return points
    }
    
    public class func save(_ point: LJAnnotaionVM) throws
    {
        if let dbModel = point.dbModel {
            try realm!.write {
                realm!.add(dbModel)
            }
        }
    }
}
