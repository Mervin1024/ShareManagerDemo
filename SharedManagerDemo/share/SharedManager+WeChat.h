//
//  SharedManager+WeChat.h
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/25.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager.h"

@interface SharedManager (WeChat) <WXApiDelegate>

- (void)sharedToWeChatWithObject:(SharedObject *)sharedObj;
- (void)sharedToWechatCirclesWithObject:(SharedObject *)sharedObj;
@end
