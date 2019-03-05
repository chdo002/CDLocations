//
//  LocationManger.swift
//  LJL
//
//  Created by  chdo on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import Foundation

class LocationManger: NSObject, AMapLocationManagerDelegate {
    
    var resHandler: ( (LJAnnotaionVM?) -> Void )?
    
    let locationManager = AMapLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func startUpdatingLocation(result res: @escaping ( (LJAnnotaionVM?) -> Void)) {
        resHandler = nil
        locationManager.startUpdatingLocation()
        resHandler = res
    }
    
    // MARK: - AMapLocationManagerDelegate
    
    func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
        resHandler?(nil)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode!) {
        let vm = LJAnnotaionVM()
        vm.coordinate = location.coordinate
        resHandler?(vm)
        resHandler = nil
    }
}
