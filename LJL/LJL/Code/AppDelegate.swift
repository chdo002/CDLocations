//
//  AppDelegate.swift
//  LJL
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AMapServices.shared()?.apiKey = "59bbcf80ad61c15a48a98ce7ce177428"
        
        realmConfig()
        
        return true
    }

    func realmConfig() {
        
        DBService.configDB()
        
    }

}

