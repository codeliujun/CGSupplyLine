//
//  ZHMainContentCell.h
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBaseTableCell.h"

@interface ZHMainContentCell : ZHBaseTableCell

- (void)setCellImage:(UIImage *)image;

- (void)setCellTitle:(NSString *)str;

- (void)setCellPric:(CGFloat)price;

@end
