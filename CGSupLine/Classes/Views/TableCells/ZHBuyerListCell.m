//
//  ZHBuyerListCell.m
//  CGSupLine
//
//  Created by 刘俊 on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBuyerListCell.h"

@interface ZHBuyerListCell()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *orderStatus;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ZHBuyerListCell

- (void)setData:(NSDictionary *)data {
    _data = data;
    [self updateCell];
}
/*{
 "ShopJson" : null,
 "PurchaseCategory" : null,
 "Receive_Address" : "江门市江海区天鹅湾正门",
 "Total" : 5850.09,
 "ShopId" : "1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6",
 "LeadInformation" : "\/13416050223",
 "SubscribeDateShow" : "2015\/09\/15",
 "SubscribeNum" : "S2015091510",
 "SendBy" : null,
 "StateStr" : "等待付款",
 "UserName" : "江门J088店",
 "OrderTheme" : "",
 "PurchaseDetails" : null,
 "SubscribeDate" : "\/Date(1442246400000)\/",
 "State" : 1000,
 "SendTime" : null,
 "Id" : "b8eeb4b5-1252-4918-bd38-a5140117feff",
 "Remark" : null,
 "SendByMobile" : null,
 "UserId" : "b199d06f-a521-4a47-9a6f-a50e00dbdea5",
 "SendRemark" : null,
 "IsRemoveFromAPP" : false,
 "DistributionId" : "f1500937-9cc8-4533-a049-a4eb000094cb"
 }*/

- (void)updateCell {
    
    self.orderNumber.text = self.data[@"SubscribeNum"];
    self.shopName.text = self.data[@"UserName"];
    self.orderStatus.text = self.data[@"StateStr"];
    NSString *str = self.data[@"Receive_Address"];
    if ([str isEqual:[NSNull null]]) {
        self.addressLabel.text = @"null";
    }else {
        self.addressLabel.text = self.data[@"Receive_Address"];
    }
    
    self.timeLabel.text = [self getDateStr];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f",[self.data[@"Total"] floatValue]];
    
}

- (NSString *)getDateStr {
    
    NSString *time1 = self.data[@"SubscribeDate"];
    
    if ([time1 isEqual:[NSNull null]] || time1 == nil || [time1 isEqualToString:@""]) {
        time1 = self.data[@"PurchaseDate"];
    }
    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
