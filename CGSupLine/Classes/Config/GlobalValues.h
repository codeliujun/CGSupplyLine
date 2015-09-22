//
//  GlobalValues.pch
//  ZHTourist
//
//  Created by Michael Shan on 15/8/2.
//  Copyright (c) 2015年 Michael. All rights reserved.
//


/**
 * 全局用到的变量、常量
 */

#ifndef ZHTourist_GlobalValues_pch
#define ZHTourist_GlobalValues_pch

//导航栏颜色
#define kNavigationBarColor             kColorHexString(@"#0E99A1")
//主题的颜色
#define kThemeColor                     kColorHexString(@"#0E99A1")
//绿色
#define kGreenColor                     kColorHexString(@"#3e9fff")
//黄色
#define KYellowColor                    kColorHexString(@"#ff9900")

//cell 灰色，当没有内容填入，用默认值的时候
#define kLightBgColor                   kColorHexString(@"#ebebeb")
//背景，浅灰色
#define kLightTextColor                 kColorHexString(@"#666666")
//灰色背景色 深灰
#define kDarkTextColor                  kColorHexString(@"#333333")

#define kLineColor                      kColorHexString(@"#aeaeae")


//// grouped table的背景颜色
//#define kGroupedTableBackgroundColor    kColorHexString(@"#f2f2f2")
////灰色字体的颜色
//#define kGrayTextColor                  kColorHexString(@"#c6c6c6")
//
//随机颜色
#define kArc4RandColor                  [UIColor colorWithRed:arc4random()%255/255.f green:arc4random()%255/255.f blue:arc4random()%255/255.f alpha:1];
//
//
//蓝色按钮颜色
#define kBlueBtnNormalColor             kColorHexString(@"#03A9F4")
#define kBlueBtnSelectedColor           kColorHexString(@"#53cb5c")
//灰色按钮颜色
#define kGrayBtnNormalColor             kColorHexString(@"#909090")
#define kGrayBtnSelectedColor           kColorHexString(@"#a1a1a1")

//透明的颜色
#define kClearColor                     [UIColor clearColor]

#endif
