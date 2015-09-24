//
//  ZHMyInfoController.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZHMyInfoController.h"
#import "ZHBuyerListCell.h"

@interface ZHMyInfoController ()
@end

@implementation ZHMyInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"采购审核";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHBuyerListCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZHBuyerListCell class])];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   
}

- (void)loadData {
    /*ttp://api.coolgou.com/api/scm/subscribelist?shopid=1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6&date=2015-09-15&pageindex=1&pagesize=10&status=-1*/
    WS(ws);
    [self requestMethod:@"scm/subscribelist" parameter:@{@"shopid":@"1c0d6e5a-45bd-4f0a-b625-a50e00dbdea6",@"date":@"2015-09-15",@"pageindex":@1,@"status":@(-1),@"pagesize":@10} Success:^(NSDictionary *result) {
        ws.dataListArray = result[@"Data"];
        [ws.tableView reloadData];
    } Error:^(NSDictionary *error) {
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHBuyerListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZHBuyerListCell class]) forIndexPath:indexPath];
    cell.data = self.dataListArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

@end
