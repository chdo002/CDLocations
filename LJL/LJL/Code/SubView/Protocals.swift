//
//  protocals.swift
//  Locations
//
//  Created by 陈栋 on 2019/3/4.
//  Copyright © 2019 chdo. All rights reserved.
//

import Foundation

protocol MapActionProtocals: NSObjectProtocol {
    
    var selectLocationHandler: ( (LJAnnotaionVM) -> Void )? { get set }
    
}
