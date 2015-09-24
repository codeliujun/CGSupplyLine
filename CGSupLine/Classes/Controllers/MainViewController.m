//
//  MainViewController.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "MainViewController.h"
#import "ZHMainHeaderView.h"
#import "LIUChooseArea.h"
#import "ZHMainContentCell.h"

@interface MainViewController () {
    ZHMainHeaderView *_headerView;
    
    ZHMainContentCell *_cell1;
    ZHMainContentCell *_cell2;
    ZHMainContentCell *_cell3;
    NSArray           *_cells;
    
}

@property (nonatomic ,assign)BOOL isLoadOrderCount;

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"首页";
    [self creatTableHeaderView];
    [self creatCell];
}

- (void)creatTableHeaderView {
    WS(ws);
    _headerView = [ZHMainHeaderView view];
    [_headerView setCustomViewContent:@"请选择门店地区"];
    _headerView.didTapChooseAreaBlock = ^() {
        [ws chooseArea];
    };
    //_headerView.backgroundColor = kThemeColor;
    self.tableView.tableHeaderView = _headerView;
    
}

- (void)creatCell {
    
    _cell1 = [ZHMainContentCell cell];
    [_cell1 setCellImage:[UIImage imageNamed:@"today_mao"]];
    [_cell1 setCellTitle:@"今日毛利"];
    [_cell1 setCellPric:100.f];
    
    _cell2 = [ZHMainContentCell cell];
    [_cell2 setCellImage:[UIImage imageNamed:@"moth"]];
    [_cell2 setCellTitle:@"本月毛利"];
    [_cell2 setCellPric:10.0];
    
    _cell3 = [ZHMainContentCell cell];
    [_cell3 setCellImage:[UIImage imageNamed:@"today"]];
    [_cell3 setCellTitle:@"今日开销"];
    [_cell3 setCellPric:1220.0];
    
    _cells = @[_cell1,_cell2,_cell3];
}

- (void)chooseArea {
    WS(ws);
    LIUChooseArea *chooseArea = [[LIUChooseArea alloc]init];
    chooseArea.currentArreaType = AreaTypeProvince;
    chooseArea.provinceid = @"";
    chooseArea.cityid = @"";
    chooseArea.areaTitle = @"城市选择";
    chooseArea.chooseAreaBlock = ^(NSDictionary *dic) {
        [ws updateAreaLabelwith:dic];
        NSLog(@"%@",dic);
    };
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:chooseArea];
    //    [self.navigationController pushViewController:chooseArea animated:YES];
    [self presentViewController:navi animated:YES completion:nil];
    
}

- (void)updateAreaLabelwith:(NSDictionary *)dic {
    
    NSDictionary *dic1 = dic[@"province"];
    NSDictionary *dic2 = dic[@"city"];
    NSDictionary *dic3 = dic[@"area"];
    NSDictionary *dic4 = dic[@"shop"];
    ZHUserObj *obj = [ZHConfigObj configObject].userObject;
    obj.shopId = dic4[@"Id"];
    NSLog(@"%@",dic4);
    NSString *areaStr = [NSString stringWithFormat:@"%@,%@,%@,%@",dic1[@"Name"],dic2[@"Name"],dic3[@"Name"],dic4[@"FullName"]];
    [_headerView setCustomViewContent:areaStr];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self userIsLogin]) {
        [self showLoginView];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHMainContentCell *cell = nil;
    
    cell = _cells[indexPath.row];
    
    if (cell == nil) {
        cell = [ZHMainContentCell cell];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cell1.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100.f;
}



@end

/*
 http://api.coolgou.com/api/scm/subscribelist?shopid=1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6&date=2015-09-15&pageindex=1&pagesize=10&status=-1   这是审核清单列表
 曾招林  22:15:29
 http://api.coolgou.com/api/scm/subscribedetail?id=7fbfa5b2-afe6-4018-8470-a51400c41399  这是详情
 一坨会飞的翔 1016  22:15:31
 
 曾招林  22:16:15
 http://api.coolgou.com/api/scm/shoptopsell?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&pageindex=1&pagesize=10&enddate=2015-09-21&startdate=2015-08-01
 曾招林  22:16:27
 这是  消费排行，只取前10
 曾招林  22:16:53
 http://api.coolgou.com/api/scm/shopsellreport?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&enddate=2015-09-21&startdate=2015-08-01  这是销售统计报表
 曾招林  22:17:50
 http://api.coolgou.com/api/scm/shopsellreport?shopid=fe446deb-7e80-4ad3-b1c4-a4fa00a346ca&enddate=2015-09-21&startdate=2015-08-01 每日销售明细
 
 */

