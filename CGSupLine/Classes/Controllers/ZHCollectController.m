//
//  ZHCollectController.m
//  ZHTourist
//
//  Created by liujun on 15/8/11.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZHCollectController.h"
#import "ZHSellInfoController.h"

@interface ZHCollectController () {
    NSArray  *_dataSource;
}

@end

@implementation ZHCollectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的报表";
    _dataSource = @[@"销售统计报表",@"每日销售明细报表",@"商品消费排行"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHSellInfoController *sellInfoVC = [[ZHSellInfoController alloc]init];
    
    switch (indexPath.row) {
        case 0:
            sellInfoVC.type = ControllerTypeCountList;
            break;
        case 1:
            sellInfoVC.type = ControllerTypeDayList;
            break;
        case 2:
            sellInfoVC.type = ControllerTypeCharts;
            break;
            
        default:
            break;
    }
    
    
    sellInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sellInfoVC animated:YES];
    
    
}



@end
