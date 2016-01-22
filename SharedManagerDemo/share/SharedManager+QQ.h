//
//  SharedManager+QQ.h
//  ShareManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager.h"
typedef NS_ENUM(NSInteger, QQSendScene) {
    SEND_TO_QQ      =   0,
    SEND_TO_QZONE   =   1,
};

@interface SharedManager (QQ)<TencentApiInterfaceDelegate,TencentLoginDelegate, TencentSessionDelegate, QQApiInterfaceDelegate>

- (void)sharedToQQWithObject:(SharedObject *)sharedObj;
- (void)sharedToQZoneWithObject:(SharedObject *)sharedObj;

@end
