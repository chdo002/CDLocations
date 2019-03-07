//
//  MapViewController.swift
//  Locations
//
//  Created by  chdo on 2019/3/3.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

/// 地图视图
class MapViewController: UIViewController,MAMapViewDelegate,MapActionProtocals {
    
    // MARK: - MapActionProtocals
    var selectLocationHandler: ((LJAnnotaionVM) -> Void)?
    
    let mapView = MAMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.frame = self.view.bounds;
        self.view.addSubview(mapView)
        mapView.showsUserLocation = true
        mapView.isRotateEnabled = false
        mapView.userTrackingMode = .follow
        mapView.showsCompass = false
        mapView.delegate = self
        
    }
    

    @objc func addAnnotation(anno annotation: LJAnnotaionVM, to map: MAMapView) -> LJAnnotaionVM{
        map.addAnnotation(annotation)
        return annotation
    }
    
    @objc func addCoordinate(cor coordinate: CLLocationCoordinate2D, to map: MAMapView) -> LJAnnotaionVM{
        let pointAnnotation = LJAnnotaionVM()
        pointAnnotation.coordinate = coordinate
        
        let pointdbModel = AnnotationDBModel()
        pointdbModel.latitude = coordinate.latitude
        pointdbModel.longitude = coordinate.longitude
        
        let ljdbModel = LJObjDBModel()
        ljdbModel.info = Date().description
        
        pointdbModel.ljModel = ljdbModel
        pointAnnotation.dbModel = pointdbModel
        return addAnnotation(anno: pointAnnotation, to: map)
    }
    
    // MARKL - MAMapViewDelegate
    
    func mapView(_ mapView: MAMapView!, didSingleTappedAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MAMapView!) {
        
    }
}
