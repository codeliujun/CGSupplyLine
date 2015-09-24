//
//  ZHChooseLoginType.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#define kTopHeight          60
#define kBottomHeight       60
#define kCellHeight         44.0f
#define kLeftGap            20
#define kViewWidth          kScreenWidth - 2*kLeftGap

#import "ZHChooseLoginType.h"
#import "ZHChoLoginTypeCell.h"
#import "AppDelegate.h"

@interface ZHChooseLoginType ()<UITableViewDataSource,UITableViewDelegate>{
    
    CGFloat             _viewHeight;
    UITableView         *_tableView;
    NSArray             *_dataSource;
    NSInteger           _currentIndex;
    UIVisualEffectView  *_visualEffectView;
    
}

@end

@implementation ZHChooseLoginType

+ (ZHChooseLoginType *)viewWithDataSource:(NSArray *)dataSource FirstIndex:(NSInteger)index {
    CGPoint center = CGPointMake(kScreenWidth*0.5, kScreenHeight*0.5);
    CGFloat viewHeight = kTopHeight+kBottomHeight+kCellHeight*dataSource.count;
    ZHChooseLoginType *view = [[ZHChooseLoginType alloc]initWithFrame:CGRectMake(kLeftGap, center.y-viewHeight*0.5, kViewWidth, viewHeight)];
    view->_viewHeight = viewHeight;
    view->_dataSource = dataSource.copy;
    view->_currentIndex = index;
    [view creatUI];
    
    return view;
}


- (void)creatUI {
    
    self.layer.cornerRadius = 20.f;
    self.layer.masksToBounds = YES;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, kViewWidth, kCellHeight*_dataSource.count) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    
    //创建毛玻璃层
    _visualEffectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    _visualEffectView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    _visualEffectView.alpha = 0.5f;
    
    //创建头部的view
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kTopHeight)];
    view.backgroundColor = kThemeColor;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, kTopHeight*0.5-13, kViewWidth-30, 25)];
    label.textColor = [UIColor whiteColor];
    label.text = @"用户类型选择";
    [view addSubview:label];
    [self addSubview:view];
    
    //注册cell
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHChoLoginTypeCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZHChoLoginTypeCell class])];
    
    //创建底部的view
    UIView *btView = [[UIView alloc]initWithFrame:CGRectMake(-1, _viewHeight-kBottomHeight, kViewWidth+2, kBottomHeight)];
    btView.layer.borderColor = kLineColor.CGColor;
    btView.layer.borderWidth = 1.0f;
    
    UIButton *b1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.width*0.5, kBottomHeight)];
    b1.backgroundColor = [UIColor whiteColor];
    [b1 setTitle:@"取消" forState:UIControlStateNormal];
    [b1 setTitleColor:kLightTextColor forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(cancle:) forControlEvents:UIControlEventTouchUpInside];
    [btView addSubview:b1];
    
    UIView *gapView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(b1.frame), 0, 1, kBottomHeight)];
    gapView.backgroundColor = kLineColor;
    [btView addSubview:gapView];
    
    UIButton *b2 = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(gapView.frame), 0, self.width*0.5, kBottomHeight)];
    b2.backgroundColor = [UIColor whiteColor];
    [b2 setTitle:@"确定" forState:UIControlStateNormal];
    [b2 setTitleColor:kLightTextColor forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(confirm:) forControlEvents:UIControlEventTouchUpInside];
    [btView addSubview:b2];
    
    [self addSubview:btView];
    
}


#pragma --mark buttonEvent

- (void)cancle:(UIButton *)sender {
    
    [self dismiss];
    
}

- (void)confirm:(UIButton *)sender {
    
    if (self.didChooseLoginTypeblock) {
        self.didChooseLoginTypeblock(_dataSource[_currentIndex]);
        [self dismiss];
    }
    
}

- (void)show {
    
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    [window addSubview:_visualEffectView];
    [window addSubview:self];
    [window bringSubviewToFront:self];
    
}

- (void)dismiss {
    
    [_visualEffectView removeFromSuperview];
    [self removeFromSuperview];
    
}




#pragma  --mark Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHChoLoginTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZHChoLoginTypeCell class]) forIndexPath:indexPath];
    
    NSString *str = _dataSource[indexPath.row];
    [cell setCellLabelStr:str];
    if (_currentIndex == indexPath.row) {
        [cell cellIsSlected:YES];
    }else{
        [cell cellIsSlected:NO];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _currentIndex = indexPath.row;
    [tableView reloadData];
    
}




@end
