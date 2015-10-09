//
//  ZHBuyDeGoodsCell.m
//  CGSupLine
//
//  Created by liujun on 15/9/25.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBuyDeGoodsCell.h"
#import "UIImage+GetUrlImage.h"

@interface ZHBuyDeGoodsCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@end


@implementation ZHBuyDeGoodsCell

- (void)setGoodsInfo:(NSDictionary *)goodsInfo {
    _goodsInfo = goodsInfo;
    [self updateContent];
}

- (void)updateContent {
    
    self.title.text = self.goodsInfo[@"ProductJson"][@"Name"];
    self.count.text = [NSString stringWithFormat:@"%@",self.goodsInfo[@"StockInNum"]];
    //NSLog(@"%.2f====%.2f@",[self.goodsInfo[@"Price"] floatValue],[self.goodsInfo[@"Total"] floatValue]);
    self.price.text = [NSString stringWithFormat:@"￥%.2f",[self.goodsInfo[@"Price"] floatValue]] ;
    self.totalPrice.text = [NSString stringWithFormat:@"￥%.2f",[self.goodsInfo[@"Total"] floatValue]];
    WS(ws);
    [UIImage getImageWithThumble:self.goodsInfo[@"ProductJson"][@"ThumbUrl"] Success:^(UIImage *image) {
        ws.cellImageView.image = image;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
