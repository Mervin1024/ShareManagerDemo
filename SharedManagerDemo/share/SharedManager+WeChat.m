//
//  SharedManager+WeChat.m
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/25.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager+WeChat.h"

@implementation SharedManager (WeChat)

- (void)sharedToWeChatWithObject:(SharedObject *)sharedObj{
    [self sharedToWeChatWithObject:sharedObj scene:WXSceneSession];
    
}

- (void)sharedToWechatCirclesWithObject:(SharedObject *)sharedObj{
    [self sharedToWeChatWithObject:sharedObj scene:WXSceneTimeline];
}

- (void)sharedToWeChatWithObject:(SharedObject *)sharedObj  scene:(enum WXScene)scene{
    switch (sharedObj.purpose) {
        case ShareInfoPurposeForText:{
            SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
            req.bText = YES;
            req.text = sharedObj.content;
            req.scene = scene;
            [WXApi sendReq:req];
            break;
        }
        case ShareInfoPurposeForImage:{
            
            break;
        }
            
            
        default:
            break;
    }
}


@end
