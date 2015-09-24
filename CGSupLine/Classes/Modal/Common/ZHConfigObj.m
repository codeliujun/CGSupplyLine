//
//  ZHConfigObj.m
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "ZHConfigObj.h"
#import "ZHCache.h"

#define kUserInfo   @"userInfo"

static ZHConfigObj *configObj = nil;

@implementation ZHConfigObj

+ (NSString *)getSavePath {
    
    NSString *home = NSHomeDirectory();
    NSString *document = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [document stringByAppendingPathComponent:@"LoginInfo.plist"];
    
    return filePath;
    
}

+ (void)saveLoginInfo:(NSDictionary*)dic {
    
    if ([dic writeToFile:[self getSavePath] atomically:YES]) {
        NSLog(@"存入成功");
    }
    else {
        NSLog(@"写入失败");
    }
    
    
}
+ (NSDictionary *)getLoginInfo {
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[self getSavePath]];
    
    return dic;
    
}

//单例
+ (instancetype)configObject {
    @synchronized(self) {
        if (!configObj) {
            configObj = [[self alloc] init];
        }
    }
    
    return configObj;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (configObj == nil) {
            configObj = [super allocWithZone:zone];
            
            return configObj; // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

#pragma mark - methods
- (id)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

//- (ZHUserObj *)userObject {
//    if (!_userObject) {
//        _userObject = (ZHUserObj *)[[ZHCache sharedCache] objectForKey:kUserInfo];
//    }
//    
//    if (!_userObject) {
//        _userObject = [[ZHUserObj alloc] init];
//    }
//    
//    return _userObject;
//}

- (void)save {
    [[ZHCache sharedCache] setObject:_userObject forKey:kUserInfo];
}


@end
