//
//  ZHUserObj.h
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//
#import <Mantle/Mantle.h>

@interface ZHUserObj : MTLModel <MTLJSONSerializing>


@property (nonatomic, copy) NSString *loginid;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *Code;

@property (nonatomic, copy) NSString *lastname;

@property (nonatomic, assign) NSInteger Balance;

@property (nonatomic, copy) NSString *ThumbFileId;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, assign) NSInteger IntegralNumber;

@property (nonatomic, assign) NSInteger Level;

@property (nonatomic, copy) NSString *ThumbUrl;

@property (nonatomic,strong)NSString *shopId;

@end
