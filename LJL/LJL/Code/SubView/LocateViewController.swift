//
//  LocateViewController.swift
//  LJL
//
//  Created by  chdo on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

class LocateViewController: UIViewController {
    
    var delegate: MapActionProtocal?
    
    let locater = LocationManger()
    
    let locateBut = UIButton(type: .custom)
    
    let pinBut = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = UIColor.red
        
        locateBut.setImage(UIImage(named: "target-lock"), for: .normal)
        locateBut.backgroundColor = UIColor.white
        locateBut.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        locateBut.layer.cornerRadius = 25;
        view.addSubview(locateBut)
        locateBut.snp.makeConstraints { (make) in
            make.top.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset( -view.bottomHeight - 40)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        locateBut.addTarget(self, action: #selector(tapLocate), for: .touchUpInside)
        
        
        pinBut.setImage(UIImage(named: "map-pin"), for: .normal)
        pinBut.backgroundColor = UIColor.white
        pinBut.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        pinBut.layer.cornerRadius = 25;
        view.addSubview(pinBut)
        pinBut.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset( -view.bottomHeight - 40)
            make.trailing.equalTo(locateBut.snp.leading).offset(-20)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        pinBut.addTarget(self, action: #selector(tapLocate), for: .touchUpInside)
    }
    
    @objc func tapLocate() {
        locater.startUpdatingLocation { [weak self] (vm : LJAnnotaionVM?) in
            if let location = vm {
//                self?.selectLocationHandler?(location)
                self?.delegate?.selectLocation(location, from: self!)
            }
        }
    }
    
    @objc func tapPinButton(){
        
    }
    
}
