//
//  ZHSellInfoCell.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHSellInfoCell.h"

@interface ZHSellInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderTitle;

@property (weak, nonatomic) IBOutlet UILabel *orderNo;

@property (weak, nonatomic) IBOutlet UILabel *sellCount;

@property (weak, nonatomic) IBOutlet UILabel *sellPrice;

@end

@implementation ZHSellInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
