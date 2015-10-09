//
//  ZHBuyChartCell.m
//  CGSupLine
//
//  Created by liujun on 15/9/25.
//  Copyright © 2015年 Michael. All rights reserved.
//

#define kFirstColor             kThemeColor
#define kSecondColor            [UIColor greenColor]
#define kThirdColor             [UIColor orangeColor]
#define kDefaultColor           [UIColor blackColor]

#import "ZHBuyChartCell.h"

@interface ZHBuyChartCell ()

@property (weak, nonatomic) IBOutlet UILabel *rate;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *goodNumber;
@property (weak, nonatomic) IBOutlet UILabel *goodBarCode;
@property (weak, nonatomic) IBOutlet UILabel *goodCount;


@end

@implementation ZHBuyChartCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellRate:(NSInteger)rate Info:(NSDictionary *)info {
   
    self.rate.text = [NSString stringWithFormat:@"%d",rate+1];
    switch (rate+1) {
        case 1:
            self.rate.textColor = kFirstColor;
            break;
        case 2:
            self.rate.textColor = kSecondColor;
            break;
        case 3:
            self.rate.textColor = kThirdColor;
            break;
        default:
            self.rate.textColor = kDefaultColor;
            break;
    }
    
    self.title.text = info[@"Name"];
    self.goodNumber.text = [NSString stringWithFormat:@"商品序列编号：  %@",info[@"Code"]];
    self.goodBarCode.text = [NSString stringWithFormat:@"商品条码：%@",info[@"BarCode"]];
    self.goodCount.text = [NSString stringWithFormat:@"售出数量：%d",[info[@"Number"] intValue]];
    
}

@end
