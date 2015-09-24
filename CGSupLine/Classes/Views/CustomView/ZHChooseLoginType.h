//
//  ZHChooseLoginType.h
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DidChooseLoginTypeBlock) (NSString *);

@interface ZHChooseLoginType : UIView

@property (nonatomic,copy) DidChooseLoginTypeBlock didChooseLoginTypeblock;

+ (ZHChooseLoginType *)viewWithDataSource:(NSArray *)dataSource FirstIndex:(NSInteger)index;
- (void)show;
- (void)dismiss;

@end
