//
//  ZHChoLoginTypeCell.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHChoLoginTypeCell.h"

@interface ZHChoLoginTypeCell ()

@property (weak, nonatomic) IBOutlet UILabel *customCellLabel;

@property (weak, nonatomic) IBOutlet UIImageView *didChooseView;

@end

@implementation ZHChoLoginTypeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellLabelStr:(NSString*)str {
    self.customCellLabel.text = str;
}

- (void)cellIsSlected:(BOOL)isSelect {
    
    self.didChooseView.highlighted = isSelect;
    
}


@end
