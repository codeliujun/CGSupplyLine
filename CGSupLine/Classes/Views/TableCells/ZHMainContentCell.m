//
//  ZHMainContentCell.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHMainContentCell.h"
@interface ZHMainContentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@property (weak, nonatomic) IBOutlet UILabel *cellPriceLabel;

@end

@implementation ZHMainContentCell



- (void)setCellImage:(UIImage *)image {
    
    self.cellImageView.image = image;
    
}

- (void)setCellTitle:(NSString *)str {
    
    self.cellLabel.text = str;
    
}

- (void)setCellPric:(CGFloat)price {
    
    self.cellPriceLabel.text = [NSString stringWithFormat:@"%.2f元",price];
    
}




@end
