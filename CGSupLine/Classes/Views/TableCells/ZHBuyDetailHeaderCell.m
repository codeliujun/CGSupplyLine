//
//  ZHBuyDetailHeaderCell.m
//  CGSupLine
//
//  Created by liujun on 15/9/25.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBuyDetailHeaderCell.h"
@interface ZHBuyDetailHeaderCell ()

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *order;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *shop;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end

@implementation ZHBuyDetailHeaderCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setOrderInfo:(NSDictionary *)orderInfo   {
    
    _orderInfo = orderInfo;
    [self updateContent];
    
}

- (void)updateContent {
    
    self.order.text = self.orderInfo[@"SubscribeNum"];
    self.price.text = [NSString stringWithFormat:@"￥%.2f",[self.orderInfo[@"Total"] floatValue]];
    self.shop.text = self.orderInfo[@"UserName"];
    self.address.text = self.orderInfo[@"Receive_Address"];
    self.time.text = [self getDateStr];
    
}

- (NSString *)getDateStr {
    
    NSString *time1 = self.orderInfo[@"SubscribeDate"];
    if ([time1 isEqual:[NSNull null]]) {
        return @"时间没有";
    }
    NSString *time2 = [time1 substringWithRange:NSMakeRange(6,10 /*time1.length-8*/)];
    NSLog(@"%@===%@",time1,time2);
    
    NSInteger timeInterval = [time2 integerValue];
    // NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"YYYY/MM/dd";
    return [df stringFromDate:date];
}

@end
