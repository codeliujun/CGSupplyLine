//
//  ZHSellInfoController.h
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

typedef NS_ENUM(NSUInteger, ControllerType) {
    ControllerTypeCountList, //销售统计
    ControllerTypeDayList,  //每日明细
    ControllerTypeCharts,       //排行
};

#import "ZHBaseTableController.h" //销售报表

@interface ZHSellInfoController : ZHBaseTableController

@property (nonatomic,assign)ControllerType  type;

@end
