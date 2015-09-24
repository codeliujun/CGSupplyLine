//
//  ZHUserCenterHeaderView.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHUserCenterHeaderView.h"

@interface ZHUserCenterHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *areaLabel;

@end

@implementation ZHUserCenterHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.cornerRadius = self.iconImageView.height*0.5;
    self.iconImageView.layer.masksToBounds = YES;
}

@end
