//
//  Tools.swift
//  LJL
//
//  Created by  chdo on 2019/3/10.
//  Copyright © 2019 chdo. All rights reserved.
//

import Foundation



extension UIView {
    
    var statusBarHeight : CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    var bottomHeight : CGFloat {
        return statusBarHeight > 20 ? 34 : 0
    }
    
}
