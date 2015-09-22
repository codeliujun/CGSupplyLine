//
//  MainViewController.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
}

@property (nonatomic ,assign)BOOL isLoadOrderCount;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![self userIsLogin]) {
        [self showLoginView];
    }
    
}

@end
