//
//  ZHMyInfoController.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZHMyInfoController.h"
#import "ZHSellDetailController.h"
#import "ZHBuyerListCell.h"
#import "ZHNoDataCell.h"

@interface ZHMyInfoController ()

@property (nonatomic,strong)ZHNoDataCell *nodataCell;

@end

@implementation ZHMyInfoController

- (ZHNoDataCell *)nodataCell {
    if (!_nodataCell) {
        _nodataCell = [ZHNoDataCell cell];
        _nodataCell.backgroundColor = [UIColor clearColor];
    }
    return _nodataCell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _canLoad = YES;
    [self.tableView refreshHeaderEnable:YES];
    [self.tableView refreshTailEnable:YES];
    self.title = @"采购审核";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHBuyerListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZHBuyerListCell class])];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)loadData {
    /*ttp://api.coolgou.com/api/scm/subscribelist?shopid=1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6&date=2015-09-15&pageindex=1&pagesize=10&status=-1*/
//    WS(ws);
//    [self requestMethod:@"scm/subscribelist" parameter:@{@"shopid":@"1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6",@"date":@"2015-09-15",@"status":@(-1)} Success:^(NSDictionary *result) {
//        ws.dataListArray = [result[@"Data"] mutableCopy];
//        [ws.tableView reloadData];
//    } Error:^(NSDictionary *error) {
//        
//    }];
    
    [self requestMethod:@"scm/subscribelist" parameter:@{@"shopid":[self getShopId],@"date":[self getEndDate],@"status":@(-1)}];
    
}

- (NSString *)getEndDate {
    
    NSDate *date = [NSDate new];
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"YYYY-MM-dd";
    
    return [df stringFromDate:date];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.dataListArray.count == 0) {
        return 1;
    }else {
        return self.dataListArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.dataListArray.count == 0) {
        return self.nodataCell;
    }else {
        
        ZHBuyerListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZHBuyerListCell class]) forIndexPath:indexPath];
        cell.data = self.dataListArray[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataListArray.count == 0) {
        return 300.f;
    }else {
         return 110;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.dataListArray.count == 0) {
        return;
    }
    
    ZHSellDetailController *sellDetail = [[ZHSellDetailController alloc]init];
    sellDetail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sellDetail animated:YES];
    
}

@end
