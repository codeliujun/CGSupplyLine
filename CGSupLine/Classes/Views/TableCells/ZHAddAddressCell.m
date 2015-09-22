//
//  BCAddAddressCell.m
//  BookingCar
//
//  Created by Michael Shan on 14-10-2.
//  Copyright (c) 2014年 Michael. All rights reserved.
//

#import "ZHAddAddressCell.h"


@implementation ZHAddAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setCutOffRuleColor:(UIColor *)color {
    self.cutOffRule.hidden = NO;
    self.cutOffRule.backgroundColor = color;
}

- (void)setImgcellImage:(UIImage *)image {
    _imgCellIcon.image = image;
}

- (void)setCellPlaceholder:(NSString *)str {
    self.tfInputField.placeholder = str;
}

- (void)setCellDes:(NSString *)str {
    self.tfInputField.text = str;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
