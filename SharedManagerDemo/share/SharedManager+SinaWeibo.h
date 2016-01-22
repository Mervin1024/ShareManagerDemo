//
//  SharedManager+SinaWeiBo.h
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "SharedManager.h"

@interface SharedManager (SinaWeibo) <SinaWeiboDelegate, SinaWeiboAuthorizeViewDelegate, SinaWeiboRequestDelegate>

- (void)sharedToSinaWeiboWithObject:(SharedObject *)sharedObj;

@end
