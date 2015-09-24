//
//  LIUChooseArea.h
//  YouYouShoppingCenter
//
//  Created by 刘俊 on 15/9/3.
//  Copyright (c) 2015年 刘俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBaseViewController.h"

typedef NS_ENUM(NSInteger, AreaType) {
    AreaTypeProvince,
    AreaTypeCityid,
    AreaTypeArea,
    AreaTypeShop,
};
typedef void (^DidChooseAreaBlock) (NSDictionary *);

@interface LIUChooseArea : ZHBaseViewController

@property (nonatomic,copy)DidChooseAreaBlock chooseAreaBlock;

@property (nonatomic,assign)AreaType currentArreaType;

@property (nonatomic,strong)NSString *provinceid;//这个是传参用的

//@property (nonatomic,strong)NSString *reallProvinceid;//这个是传数据用的

@property (nonatomic,strong)NSString *cityid;

@property (nonatomic,strong)NSString *areaid;

@property (nonatomic,strong)NSString *areaTitle;

@end
