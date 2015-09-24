//
//  ZHMoreController.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZHMoreController.h"
#import "ZHUserCenterHeaderView.h"
#import "ZHLoginController.h"

@interface ZHMoreController ()

@end

@implementation ZHMoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    [self creatTableHeaderView];
}

- (void)creatTableHeaderView {
    
    ZHUserCenterHeaderView *headerView = [ZHUserCenterHeaderView view];
    
    self.tableView.tableHeaderView = headerView;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"切换用户";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHLoginController *loginVc = [[ZHLoginController alloc]init];
    
    [self.navigationController pushViewController:loginVc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
