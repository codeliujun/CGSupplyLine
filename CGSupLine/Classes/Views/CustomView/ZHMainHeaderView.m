//
//  ZHMainHeaderView.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#define kImageViewWidth         20

#import "ZHMainHeaderView.h"

@interface ZHMainHeaderView () {
    
    UILabel         *_label;
    UIImageView     *_imageView;
    
}

@end

@implementation ZHMainHeaderView

- (void)setCustomViewContent:(NSString *)str {
    
    [_label removeFromSuperview];
    _label = nil;
    [_imageView removeFromSuperview];
    _imageView = nil;
    
    
    _label = [[UILabel alloc]init];
    _label.text = str;
    _label.textColor = [UIColor whiteColor];
    //_label.backgroundColor = kArc4RandColor;
    CGRect bounds = [_label textRectForBounds:CGRectMake(0, 0, kScreenWidth-50, 25) limitedToNumberOfLines:1];
    [self addSubview:_label];
    //CGFloat totalWidth = bounds.size.width+10+kImageViewWidth;
    WS(ws);
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws).with.offset(0);
        make.centerX.equalTo(ws).with.offset(0);
        make.height.equalTo(@(bounds.size.height));
        make.width.equalTo(@(bounds.size.width));
    }];
    
    _imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"ic_arrow"];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
    __weak UILabel *weakLabel = _label;
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakLabel.mas_right).with.offset(10);
        make.height.equalTo(@(kImageViewWidth));
        make.width.equalTo(@(kImageViewWidth));
        make.centerY.equalTo(weakLabel.mas_centerY);
    }];
    
}
- (IBAction)chooseArea:(UIButton *)sender {
    
    if (self.didTapChooseAreaBlock) {
        self.didTapChooseAreaBlock();
    }
    
}

@end
