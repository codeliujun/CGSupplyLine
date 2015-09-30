//
//  CGBaseView.swift
//  CGSupply
//
//  Created by liujun on 15/9/21.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit

class CGBaseView: UIView {

    class func identify()->String {
        let str = NSStringFromClass(self.classForCoder())
        let subs = str.componentsSeparatedByString(".")
        return subs[1]
    }
    
    class func view() -> AnyObject? {
        
        let view = NSBundle.mainBundle().loadNibNamed(self.identify(), owner: nil, options: nil).first
        return view
    }
    
}
