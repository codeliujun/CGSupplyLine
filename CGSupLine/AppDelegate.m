//
//  AppDelegate.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHLoginController.h"
#import <SMS_SDK/SMS_SDK.h>
//#import "ZHCommonObject.h"
#import <GPSKit/CLHGPSKit.h>

const NSString  *mobAppKey =  @"9b39e0567460";
const NSString  *mobAppSecret = @"90c5f30df0fa5ae6bee7f5eef9eafc6c";

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [NSThread sleepForTimeInterval:2.0f];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    
    [[UINavigationBar appearance] setBarTintColor:kThemeColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSLog(@"screenWidth: %f, screenHeight: %f", kScreenWidth, kScreenHeight);
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // 进入应用
    //self.window.rootViewController = [ZHCommonObject prepareTabbars];
    UIViewController *login = [[ZHLoginController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:login];
    self.window.rootViewController = navi;
    
    
    //注册验证码通知
    [SMS_SDK registerApp:mobAppKey withSecret:mobAppSecret];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
