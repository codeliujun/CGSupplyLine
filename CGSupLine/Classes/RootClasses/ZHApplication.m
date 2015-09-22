//
//  ZHApplication.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/30.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZHApplication.h"

#define kScreenTouchNotifiation @"notification_screen_touch"
#define kScreenTouchEnabled     @"enable_screen_touch"

@implementation ZHApplication

- (void)sendEvent:(UIEvent *)event {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kScreenTouchEnabled]) {
        if (event.type == UIEventTypeTouches) {
            if ([[event.allTouches anyObject] phase] == UITouchPhaseBegan) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kScreenTouchNotifiation object:nil userInfo:@{@"data":event}];
            }
        }
    }
    
    [super sendEvent:event];
}

@end
