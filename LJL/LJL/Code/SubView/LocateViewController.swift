//
//  LocateViewController.swift
//  LJL
//
//  Created by  chdo on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import UIKit

class LocateViewController: UIViewController {

    let locater = LocationManger()
    
    let locateBut = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        locateBut.setImage(UIImage(named: "dingwei"), for: .normal)
        view.addSubview(locateBut)
        locateBut.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        locateBut.addTarget(self, action: #selector(tapLocate), for: .touchUpInside)
        
    }
    
    @objc func tapLocate() {
        locater.startUpdatingLocation { (vm : LJAnnotaionVM?) in

        }
    }
    

}
