//
//  SharedManager+YiXin.m
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/25.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager+YiXin.h"

@implementation SharedManager (YiXin)
#pragma mark - YiXin API Delegate
- (void)onReceiveRequest:(YXBaseReq *)req{
    //
}

- (void)onReceiveResponse:(YXBaseResp *)resp{
    //
}
#pragma mark - share
- (void)sharedToYiXinWithObject:(SharedObject *)sharedObj{
    [self sharedToYiXinWithObject:sharedObj scene:kYXSceneSession];
}
- (void)sharedToYiXinCirclesWithObject:(SharedObject *)sharedObj{
    [self sharedToYiXinWithObject:sharedObj scene:kYXSceneTimeline];
}

- (void)sharedToYiXinWithObject:(SharedObject *)sharedObj scene:(enum YXScene)scene{
    
}

@end
