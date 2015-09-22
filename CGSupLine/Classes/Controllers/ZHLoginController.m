//
//  BCLoginController.m
//  BookingCar
//
//  Created by Michael Shan on 14-10-3.
//  Copyright (c) 2014年 Michael. All rights reserved.
//

#import "ZHLoginController.h"
#import "ZHLoginCell.h"

#define kForgetPwdHighlightColor             kColorHexString(@"#0078ff")
#define kTableHeaderHeight                   270
#define kTableFootHeight                     150

@interface ZHLoginController (){
    
        ZHLoginCell             *_loginCell;
    
}


@end

@implementation ZHLoginController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self creatCell];
    self.title = @"登陆";
}

- (void)creatCell {
    
    _loginCell = [ZHLoginCell cell];
    
    _loginCell.didTapLoginBlock = ^(NSDictionary *dic) {
        
    };
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHLoginCell *cell = _loginCell;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _loginCell.height;
}



@end
