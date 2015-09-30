//
//  CGChoShopHeaderView.swift
//  CGSupply
//
//  Created by liujun on 15/9/30.
//  Copyright © 2015年 liujun. All rights reserved.
//

import UIKit


class CGChoShopHeaderView: CGBaseView {

    
    @IBOutlet var proImages: [UIImageView]!
    
    func proImageHilighted(index:NSInteger)->() {
        
        for i in 0..<proImages.count {
            
            let image = proImages[i] as UIImageView
            
            if i <= index {
                image.highlighted = true
            }else {
                image.highlighted = false
            }
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
