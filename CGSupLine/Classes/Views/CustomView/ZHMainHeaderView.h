//
//  ZHMainHeaderView.h
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBaseView.h"

@interface ZHMainHeaderView : ZHBaseView

- (void)setCustomViewContent:(NSString *)str;

@property (nonatomic,copy)void (^didTapChooseAreaBlock) ();

@end
