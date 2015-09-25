//
//  ZHSellDetailController.m
//  CGSupLine
//
//  Created by liujun on 15/9/25.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHSellDetailController.h"
#import "ZHBuyDetailHeaderCell.h"
#import "ZHBuyDeGoodsCell.h" 

@interface ZHSellDetailController (){
    ZHBuyDetailHeaderCell    *_headCell;
}

@property (nonatomic,strong) NSDictionary *dataInfo;

@end

@implementation ZHSellDetailController

- (NSDictionary *)dataInfo {
    if (!_dataInfo) {
        _dataInfo = @{};
    }
    return _dataInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"采购详情";
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHBuyDeGoodsCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZHBuyDeGoodsCell class])];
    _headCell = [ZHBuyDetailHeaderCell cell];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadData {
    WS(ws);
    [self requestMethod:@"scm/subscribedetail" parameter:@{@"id":@"7fbfa5b2-afe6-4018-8470-a51400c41399"} Success:^(NSDictionary *result) {
        
        ws.dataInfo = result[@"Data"];
        ws.dataListArray = [ws.dataInfo[@"PurchaseDetails"] mutableCopy];
        [ws.tableView reloadData];
        
    } Error:^(NSDictionary *error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if ([self.dataInfo allKeys].count == 0) {
        return 0;
    }else {
        return 2;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 1;
   
    if (1 == section) {
        count =  self.dataListArray.count;
    }
    
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
   
    if (0 == indexPath.section) {
        
        _headCell.orderInfo = self.dataInfo;
        cell = _headCell;
        
    }
    
    if (1 == indexPath.section) {
        ZHBuyDeGoodsCell *dCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZHBuyDeGoodsCell class]) forIndexPath:indexPath];
        dCell.goodsInfo = self.dataListArray[indexPath.row];
        cell = dCell;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 150.f;
    }else {
        return 85.0f;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

/*
 http://api.coolgou.com/api/scm/subscribelist?shopid=1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6&date=2015-09-15&pageindex=1&pagesize=10&status=-1   这是审核清单列表
 曾招林  22:15:29
 ttp://api.coolgou.com/api/scm/subscribedetail?id=7fbfa5b2-afe6-4018-8470-a51400c41399  这是详情
 一坨会飞的翔 1016  22:15:31
 
 曾招林  22:16:15
 http://api.coolgou.com/api/scm/shoptopsell?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&pageindex=1&pagesize=10&enddate=2015-09-21&startdate=2015-08-01
 曾招林  22:16:27
 这是  消费排行，只取前10
 曾招林  22:16:53
 ttp://api.coolgou.com/api/scm/shopsellreport?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&enddate=2015-09-21&startdate=2015-08-01  这是销售统计报表
 曾招林  22:17:50
 http://api.coolgou.com/api/scm/shopsellreport?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&enddate=2015-09-21&startdate=2015-08-01 每日销售明细
 
 */
