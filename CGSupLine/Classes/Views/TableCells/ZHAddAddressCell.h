//
//  BCAddAddressCell.h
//  BookingCar
//
//  Created by Michael Shan on 14-10-2.
//  Copyright (c) 2014年 Michael. All rights reserved.
//

#import "ZHBaseTableCell.h"
#import "ZHCellLineView.h"

@interface ZHAddAddressCell : ZHBaseTableCell

@property (weak, nonatomic) IBOutlet UIImageView *imgCellIcon;
@property (weak, nonatomic) IBOutlet UITextField *tfInputField;
@property (weak, nonatomic) IBOutlet UIView *cutOffRule;//cell的分割线
@property (weak, nonatomic) IBOutlet UIImageView *goImageView;
@property (weak, nonatomic) IBOutlet UIView *contentCustomView;

- (void)setImgcellImage:(UIImage *)image;
- (void)setCutOffRuleColor:(UIColor *)color;

- (void)setCellPlaceholder:(NSString *)str;
- (void)setCellDes:(NSString *)str;

@end
