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
    
    
    NSString *areaStr = [NSString stringWithFormat:@"%@,%@,%@",dic1[@"Name"],dic2[@"Name"],dic3[@"Name"]];
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
