//
//  MapViewController.swift
//  Locations
//
//  Created by  chdo on 2019/3/3.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

/// 地图视图
class MapViewController: UIViewController,MAMapViewDelegate {
    
    // MARK: - MapActionProtocals
    
    var delegate: MapActionProtocal?
    
    private let mapView = MAMapView()
    
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
    
    // MARK:- 接口
    
    /// 移除所有的图标
    func removeAllAnnotation(){
        mapView.removeAnnotations(mapView.annotations)
    }

    // 添加图标
    @objc func addAnnotation(anno annotation: LJAnnotaionVM) -> LJAnnotaionVM{
        mapView.addAnnotation(annotation)
        return annotation
    }
    
    // 通过坐标添加图标
    @objc func __addCoordinate(cor coordinate: CLLocationCoordinate2D) -> LJAnnotaionVM{
        let pointAnnotation = LJAnnotaionVM()
        pointAnnotation.coordinate = coordinate
        
        let pointdbModel = AnnotationDBModel()
        pointdbModel.latitude = coordinate.latitude
        pointdbModel.longitude = coordinate.longitude
        
        let ljdbModel = LJObjDBModel()
        ljdbModel.info = Date().description
        
        pointdbModel.ljModel = ljdbModel
        pointAnnotation.dbModel = pointdbModel
        return addAnnotation(anno: pointAnnotation)
    }
    
    // 移动到指定点
    func moveToAnnotation(_ annotation: LJAnnotaionVM){
        mapView.setCenter(annotation.coordinate, animated: true)
        mapView.setZoomLevel(17, animated: true)
    }
    
    // MARKL - MAMapViewDelegate
    
    func mapView(_ mapView: MAMapView!, didLongPressedAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(_ mapView: MAMapView!, didSingleTappedAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MAMapView!) {
        
    }
}
