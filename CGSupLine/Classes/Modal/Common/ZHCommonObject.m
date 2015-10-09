//
//  ZHCommonObject.m
//  BookingCar
//
//  Created by Michael Shan on 14-10-9.
//  Copyright (c) 2014年 Michael. All rights reserved.
//

#import "ZHCommonObject.h"
#import "ZHBaseNavigationController.h"
#import "MainViewController.h"
#import "ZHCollectController.h"
#import "ZHMyInfoController.h"
#import "ZHMoreController.h"

static ZHCommonObject *oneObject = nil;
@implementation ZHCommonObject

+ (instancetype)sharedObject {
    @synchronized(self) {
        if (!oneObject) {
            oneObject = [[self alloc] init];
        }
    }
    
    return oneObject;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (oneObject == nil) {
            oneObject = [super allocWithZone:zone];
            return oneObject; // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

+ (void)deselectTable:(UITableView *)tableView animated:(BOOL)animated {
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

- (id)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

//+ (CLLocationDistance)getCLLocationDistance:(CLLocationCoordinate2D)coordinateA TheTowCoordinate:(CLLocationCoordinate2D)coordinateB
//{
//    CLLocationDistance dis;
//    dis = BMKMetersBetweenMapPoints(BMKMapPointForCoordinate(coordinateA), BMKMapPointForCoordinate(coordinateB));
//    
//    return dis;
//}

+ (BOOL)checkLogin:(UIViewController *)controller {
    ZHUserObj *userObj = [ZHConfigObj configObject].userObject;
    BOOL isLogin = YES;
    if (userObj.Id.length == 0) {
        isLogin = NO;
//        BCLoginController *loginController = [[BCLoginController alloc] init];
//        BCBaseNavigationController *nav = [[BCBaseNavigationController alloc] initWithRootViewController:loginController];
//        [controller presentViewController:nav animated:YES completion:nil];
    }
    
    return isLogin;
}

+ (void)showLocationServiceAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"定位服务不可用" message:@"建议开启定位服务(设置>隐私>定位服务>开启智慧旅游定位服务)"
                                                   delegate:nil cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showAlert:(NSString *)alertStr {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:alertStr
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - Methods
+ (UITabBarController *)prepareTabbars {
    
    UITabBarController *tabBarcontroller = [[UITabBarController alloc] init];
  
    tabBarcontroller.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    tabBarcontroller.tabBar.tintColor = kThemeColor;
//    MainViewController *mainview = [[MainViewController alloc] initWithNibName:NSStringFromClass([MainViewController class]) bundle:[NSBundle mainBundle]];
    MainViewController *mainview = [[MainViewController alloc] init];
    ZHBaseNavigationController *navCar = [[ZHBaseNavigationController alloc] initWithRootViewController:mainview];
    navCar.tabBarItem.image = [UIImage imageNamed:@"main_n"];
    navCar.tabBarItem.selectedImage = [UIImage imageNamed:@"main_h"];
    navCar.tabBarItem.title = @"主页";
    
    ZHMyInfoController *myInfo = [[ZHMyInfoController alloc] init];
    ZHBaseNavigationController *navMyInfo = [[ZHBaseNavigationController alloc] initWithRootViewController:myInfo];
    navMyInfo.tabBarItem.image = [UIImage imageNamed:@"dong_tai_n"];
    navMyInfo.tabBarItem.selectedImage = [UIImage imageNamed:@"dong_tai_h"];
    navMyInfo.tabBarItem.title = @"采购审核";

    
    ZHCollectController *collectView = [[ZHCollectController alloc] init];
    ZHBaseNavigationController *navFind = [[ZHBaseNavigationController alloc] initWithRootViewController:collectView];
    navFind.tabBarItem.image = [UIImage imageNamed:@"message_n"];
    navFind.tabBarItem.selectedImage = [UIImage imageNamed:@"message_h"];
    navFind.tabBarItem.title = @"我的报表";
    
    ZHMoreController *moreView = [[ZHMoreController alloc] initWithNibName:nil bundle:nil];
    ZHBaseNavigationController *navMore = [[ZHBaseNavigationController alloc] initWithRootViewController:moreView];
    navMore.tabBarItem.image = [UIImage imageNamed:@"my_n"];
    navMore.tabBarItem.selectedImage = [UIImage imageNamed:@"my_h"];
    navMore.tabBarItem.title = @"个人中心";
    
    NSArray *array = nil;
    NSString *loginType = [ZHConfigObj configObject].userObject.loginType;
    
    if ([loginType isEqualToString:@"总部"]) {
        array = @[navCar, navMyInfo, navFind, navMore];
    }
    
    if ([loginType isEqualToString:@"供应商"]) {
        array = @[navMyInfo, navFind, navMore];
    }
    
    if ([loginType isEqualToString:@"门店"]) {
        array = @[navCar, navMyInfo, navFind, navMore];
    }

    tabBarcontroller.viewControllers = array;
    
    return tabBarcontroller;
}

@end
