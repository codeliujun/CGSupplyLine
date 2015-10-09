//
//  BCLoginController.m
//  BookingCar
//
//  Created by Michael Shan on 14-10-3.
//  Copyright (c) 2014年 Michael. All rights reserved.
//

#import "ZHLoginController.h"
#import "ZHLoginCell.h"
#import "LIUChooseArea.h"
#import "AppDelegate.h"
#import "ZHCommonObject.h"

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
    WS(ws);
    _loginCell = [ZHLoginCell cell];
    
    _loginCell.didTapLoginBlock = ^(NSDictionary *dic) {
        [ws loginWithDic:dic];
    };
    
}

- (void)loginWithDic:(NSDictionary *)dic {
    WS(ws);
    NSString *phone = dic[@"phone"];
    NSString *pwd = dic[@"pwd"];
    NSString *loginType = dic[@"type"];
    
    [self requestMethod:@"User/login" parameter:@{@"username":phone,@"pwd":pwd,@"logintype":@"0"} Success:^(NSDictionary *result) {
        
        ZHUserObj *obj = [ZHUserObj objectWithKeyValues:result[@"Data"]];
        obj.loginType = loginType;
        [ZHConfigObj configObject].userObject = obj;
        [ws saveInfo:dic];
        [ws.navigationController popViewControllerAnimated:YES];
   
    } Error:^(NSDictionary *error) {
        
    }];
    
    
    
}

- (void)saveInfo:(NSDictionary *)dic {
    BOOL  isRemember = [dic[@"isRemember"] boolValue];
   // NSString *type = dic[@"type"];
    if (isRemember) {
        [ZHConfigObj saveLoginInfo:dic];
    }
    
    //登录成功之后的操作 就是选择门店
    [self chooseArea];
    
}

- (void)chooseArea {
    ZHUserObj *obj = [ZHConfigObj configObject].userObject;
    
    if ([obj.loginType isEqualToString:@"总部"]) {
        WS(ws);
        LIUChooseArea *chooseArea = [[LIUChooseArea alloc]init];
        chooseArea.currentArreaType = AreaTypeProvince;
        chooseArea.provinceid = @"";
        chooseArea.cityid = @"";
        chooseArea.areaTitle = @"城市选择";
        chooseArea.chooseAreaBlock = ^(NSDictionary *dic) {
            //选择成功，那么就是进入界面
            [ws loginVC:dic];
            NSLog(@"%@",dic);
        };
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:chooseArea];
        //    [self.navigationController pushViewController:chooseArea animated:YES];
        [self presentViewController:navi animated:YES completion:nil];
    }else {
        
        [self loginVC:nil];
        
    }
    
    
}

- (void)loginVC:(NSDictionary *)dic {
   
    if (dic) {
        NSDictionary *dic1 = dic[@"province"];
        NSDictionary *dic2 = dic[@"city"];
        NSDictionary *dic3 = dic[@"area"];
        NSDictionary *dic4 = dic[@"shop"];
        NSString *areaStr = [NSString stringWithFormat:@"%@,%@,%@,%@",dic1[@"Name"],dic2[@"Name"],dic3[@"Name"],dic4[@"FullName"]];
        ZHUserObj *obj = [ZHConfigObj configObject].userObject;
        obj.shopId = dic4[@"Id"]; //给用户赋值门店
        obj.shopName = areaStr;
    }
   
    //然后就开始进入界面了
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    window.rootViewController = [ZHCommonObject prepareTabbars];
    
    
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
