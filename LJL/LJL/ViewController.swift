//
//  ViewController.swift
//  LJL
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mapVc = MapViewController()
    let searchVc = SearchViewController()
    let locateVc = LocateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        addConnecgtions()
        
    }
    
    func initUI() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 地图视图
        addChild(mapVc)
        view.addSubview(mapVc.view)
        mapVc.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        mapVc.didMove(toParent: self)
        
        // 搜索视图
        addChild(searchVc)
        view.addSubview(searchVc.view)
        searchVc.view.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
        }
        searchVc.didMove(toParent: self)
        
        // 定位视图
        addChild(locateVc)
        view.addSubview(locateVc.view)
        locateVc.view.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
    func addConnecgtions(){
        
//        mapVc.selectLocationHandler = { [weak self] (vm: LJAnnotaionVM) -> Void in
//            
//        }
        
        searchVc.selectLocationHandler = { [weak self] (vm: LJAnnotaionVM) -> Void in
            let _ = self?.mapVc.addAnnotation(anno: vm, to: (self?.mapVc.mapView)!)
        }
    }

}

