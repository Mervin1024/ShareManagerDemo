//
//  ShareSDKManager.h
//  HosApp
//
//  Created by HSH-D-2213 on 14-3-17.
//  Copyright (c) 2014年 NetEase. All rights reserved.
//

#ifndef HosApp_ENShareSDKManager_h
#define HosApp_ENShareSDKManager_h



#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

//#import <TencentOpenAPI/QQApi.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentMessageObject.h>
#import <TencentOpenAPI/TencentApiInterface.h>

//#import <RennSDK/RennSDK.h>

#import "SinaWeiboRequest.h"
#import "SinaWeiboAuthorizeView.h"
#import "SinaWeibo.h"

#import "WeiboApi.h"

#import "WXApi.h"
#import "WXApiObject.h"

#import "YXApi.h"
#import "YXApiObject.h"

#define __TencentQQAppId_               @"801524745"
#define __TencentQQAppKey_              @"bf7ec963e2732b9db2c7acf1607557b6"

#define __SinaWeiboAppKey_              @"3235452635"
#define __SinaWeiboSecret_              @"749e650bf441846a08277e98a7a515bc"
#define __SinaWeiboRedirectUrl_         @"http://www.heroesofthestorm.com.cn"

#define __TencentWeiboAppKey_           @"801524745"
#define __TencentWeiboSecret_           @"bf7ec963e2732b9db2c7acf1607557b6"
#define __TencentWeiboRedirectUrl_      @"http://heroes.blizzard.cn"

#define __WeiXinAppKey_                 @"wx0f85ab666863946e"
#define __WeiXinSecret_                 @"8cee3fb4655d7e22d8331d6b14ad79e4"

//#define __YinXinAppKey_                 @"yx8503e3fe265b4c778c9db83bd127ca05"
//#define __YinXinSecret_                 @"20e1a2105a2f4186cb"
#define __YinXinAppKey_                 @"yx8503e3fe265b4c778c9db83bd127ca05"//@"yxbd3242e8f4a349c284e6ee6326773131"
#define __YinXinSecret_                 @"20e1a2105a2f4186cb"//@"448f43131830564d20"

#define __YinXinTokenApi_               @"https://open.yixin.im/oauth/token"
#define __YinXinOAuthApi_               @"https://open.yixin.im/oauth/authorize"
#define __YinXinAppSecret_              @"4a54aa4c-4645-4e4d-80ff-c51493a548bf"
#define __YinXinUserInfo_               @"https://open.yixin.im/api/userinfo"
#define __YiXinRedirectUri_             @"https://open.yixin.im/resource/oauth2_callback.html"//@"http://114.113.197.230:8080/hosapp-1.0/yxcb"//@"http://open.yixin.im/resource/oauth2_callback.html"
#define __YiXinSendMessageApi_          @"https://open.yixin.im/api/sendp2pmsg?"

#define __YiXinHostUrl_                 @"http://ucapp.blz.netease.com"
#define __YiXinBindAppApi_              @"udb/hos/account/relation"
#define __YiXinAppFriendApi_            @"udb/hos/app"

#define __RennAppId_                    @"270220"
#define __RennAppKey_                   @"91f445d92b4b4b1598a2bc57f1d57f8d"
#define __RennSecretKey_                @"545a8629054a4c2bae7509be2c434d0f"


#endif
