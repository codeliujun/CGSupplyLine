//
//  ZHBaseView.m
//  CGSupply
//
//  Created by liujun on 15/9/22.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBaseView.h"

@implementation ZHBaseView

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}
+ (id)view {
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:[self identifier] owner:nil options:nil]firstObject];
    return view;
}
@end
