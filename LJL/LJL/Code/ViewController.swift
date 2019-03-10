//
//  ViewController.swift
//  LJL
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SearchViewProtocal {

    let mapVc = MapViewController()
    let searchVc = SearchViewController()
    let locateVc = LocateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 地图视图
        addChild(mapVc)
        mapVc.delegate = self;
        view.addSubview(mapVc.view)
        mapVc.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        mapVc.didMove(toParent: self)
        
        // 搜索视图
        addChild(searchVc)
        searchVc.delegate = self
        view.addSubview(searchVc.view)
        searchVc.view.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
        }
        searchVc.didMove(toParent: self)
        
        // 定位视图
        addChild(locateVc)
        locateVc.delegate = self
        view.addSubview(locateVc.view)
        locateVc.view.snp.makeConstraints { (make) in
            make.trailing.bottom.equalToSuperview()
        }
    }
    
    // MapActionProtocal
    
    func selectLocation(_ vm: LJAnnotaionVM, from: AnyObject) {
        
        if from.isKind(of: SearchViewController.self) {
            // 搜索
            self.mapVc.removeAllAnnotation()
            let _ = self.mapVc.addAnnotation(anno: vm)
            self.mapVc.moveToAnnotation(vm)
        } else if from.isKind(of: LocateViewController.self) {
            // 定位
            self.mapVc.moveToAnnotation(vm)
        }
    }
    
    
}
