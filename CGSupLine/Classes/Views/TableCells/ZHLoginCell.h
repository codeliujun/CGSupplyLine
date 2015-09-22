//
//  ZHLoginCell.h
//  CGSupLine
//
//  Created by 刘俊 on 15/9/22.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHBaseTableCell.h"

typedef void (^DidTapLoginButtonBlock) (NSDictionary*);

@interface ZHLoginCell : ZHBaseTableCell

@property (nonatomic,copy) DidTapLoginButtonBlock didTapLoginBlock;

@end
