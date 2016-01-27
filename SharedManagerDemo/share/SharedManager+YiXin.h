//
//  SharedManager+YiXin.h
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/25.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager.h"

@interface SharedManager (YiXin) <YXApiDelegate>

- (void)sharedToYiXinWithObject:(SharedObject *)sharedObj;
- (void)sharedToYiXinCirclesWithObject:(SharedObject *)sharedObj;
@end
