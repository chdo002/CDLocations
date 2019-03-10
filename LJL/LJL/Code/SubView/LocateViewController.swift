//
//  LocateViewController.swift
//  LJL
//
//  Created by  chdo on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

protocol LocateViewProtocal: BaseMapActionProtocal {
    
    /// 点击清除按钮
    func tappedCleanButton(_ from: AnyObject)
    
    /// 点击地点按钮
    func tappedPinButton(_ from: AnyObject)
    
}

class LocateViewController: UIViewController {
    
    var delegate: LocateViewProtocal?
    
    let locater = LocationManger()
    
    let locateBut = UIButton(type: .custom)
    
    let pinBut = UIButton(type: .custom)
    
    let cleanBut = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 定位按钮
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
        
        // 所有地点按钮
        pinBut.setImage(UIImage(named: "map-pin"), for: .normal)
        pinBut.backgroundColor = UIColor.white
        pinBut.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        pinBut.layer.cornerRadius = 25;
        view.addSubview(pinBut)
        pinBut.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset( -view.bottomHeight - 40)
            make.trailing.equalTo(locateBut.snp.leading).offset(-20)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        pinBut.addTarget(self, action: #selector(tapPinButton), for: .touchUpInside)
        
        // 清空锚点按钮
        cleanBut.setImage(UIImage(named: "x"), for: .normal)
        cleanBut.backgroundColor = UIColor.white
        cleanBut.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cleanBut.layer.cornerRadius = 25;
        view.addSubview(cleanBut)
        cleanBut.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset( -view.bottomHeight - 40)
            make.trailing.equalTo(pinBut.snp.leading).offset(-20)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        cleanBut.addTarget(self, action: #selector(tapCleanButton), for: .touchUpInside)
    }
    
    @objc func tapLocate() {
        locater.startUpdatingLocation { [weak self] (vm : LJAnnotaionVM?) in
            if let location = vm {
                self?.delegate?.selectLocation(location, from: self!)
            }
        }
    }
    
    @objc func tapPinButton(){
        self.delegate?.tappedPinButton(self)
    }
    
    @objc func tapCleanButton(){
        self.delegate?.tappedCleanButton(self)
    }
    
}
