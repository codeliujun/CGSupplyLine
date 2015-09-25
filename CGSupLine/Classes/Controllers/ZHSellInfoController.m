//
//  ZHSellInfoController.m
//  CGSupLine
//
//  Created by liujun on 15/9/24.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHSellInfoController.h"
#import "ZHSellInfoCell.h"
#import "ZHBuyChartCell.h"


@interface ZHSellInfoController ()

@end

@implementation ZHSellInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (self.type) {
        case ControllerTypeCountList:
            self.title = @"销售统计报表";
            break;
        case ControllerTypeDayList:
            self.title = @"每日销售明细报表";
            break;
        case ControllerTypeCharts:
            self.title = @"商品消费排行榜";
            break;
        default:
            break;
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHSellInfoCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZHSellInfoCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHBuyChartCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZHBuyChartCell class])];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    WS(ws);
    if (self.type == ControllerTypeCountList) {
        [self requestMethod:@"scm/shopsellreport" parameter:@{@"shopid":@"fe446deb-7e80-4ad3-b1c4-a4fa00a346ca",@"enddate":@"2015-09-21",@"startdate":@"2015-08-01"} Success:^(NSDictionary *result) {
            ws.dataListArray = [result[@"Data"] mutableCopy];
            [ws.tableView reloadData];
        } Error:^(NSDictionary *error) {
            
        }];
    }
    
    if (self.type == ControllerTypeDayList) {
        [self requestMethod:@"SCM/shopselldetail" parameter:@{@"shopid":@"fe446deb-7e80-4ad3-b1c4-a4fa00a346ca",@"enddate":@"2015-09-21",@"startdate":@"2015-08-01",@"pageindex":@"1",@"pagesize":@"10"} Success:^(NSDictionary *result) {
            ws.dataListArray = [result[@"Data"] mutableCopy];
            [ws.tableView reloadData];
        } Error:^(NSDictionary *error) {
            
        }];
    }
    
    if (self.type == ControllerTypeCharts) {
        /*ttp://api.coolgou.com/api/scm/shoptopsell?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&pageindex=1&pagesize=10&enddate=2015-09-21&startdate=2015-08-01
         曾招林  22:16:27
*/
        [self requestMethod:@"scm/shoptopsell" parameter:@{@"shopid":@"fe446deb-7e80-4ad3-b1c4-a4fa00a346ca",@"enddate":@"2015-09-21",@"startdate":@"2015-08-01",@"pageindex":@"1",@"pagesize":@"10"} Success:^(NSDictionary *result) {
            ws.dataListArray = [result[@"Data"] mutableCopy];
            [ws.tableView reloadData];
        } Error:^(NSDictionary *error) {
            
        }];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    if (self.type == ControllerTypeCharts) {
        ZHBuyChartCell *cCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZHBuyChartCell class]) forIndexPath:indexPath];
        [cCell setCellRate:indexPath.row Info:self.dataListArray[indexPath.row]];
        cell = cCell;
    }else
    {
        ZHSellInfoCell *Scell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZHSellInfoCell class]) forIndexPath:indexPath];
        Scell.data = self.dataListArray[indexPath.row];
        cell = Scell;
    }
    
    if (cell == nil) {
        cell = [UITableViewCell new];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 106.f;
}




@end

/* 曾招林  22:16:15
ttp://api.coolgou.com/api/scm/shoptopsell?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&pageindex=1&pagesize=10&enddate=2015-09-21&startdate=2015-08-01
 曾招林  22:16:27
 这是  消费排行，只取前10
 曾招林  22:16:53
 ttp://api.coolgou.com/api/scm/shopsellreport?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&enddate=2015-09-21&startdate=2015-08-01  这是销售统计报表
 曾招林  22:17:50
 ttp://api.coolgou.com/api/scm/shopsellreport?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&enddate=2015-09-21&startdate=2015-08-01 每日销售明细
 
 */
