/*! \file $Id: PerformCallback.h 26870 2013-06-18 09:47:09Z skh $
 * \author shikh
 * \brief ios autolock
 */
//
//  PerformCallback.h
//  controlclient
//
//  Created by shikh on 12-7-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef controlclient_performCallback_h
#define controlclient_performCallback_h

#import <Foundation/Foundation.h>

static
void performCallback(id objCallback, NSString* callbackFunction, id arg1, id arg2) {
    SEL func_selector = NSSelectorFromString(callbackFunction);
    if (objCallback) {
        if ([objCallback respondsToSelector:func_selector]) {
            [objCallback performSelector:func_selector withObject:arg1 withObject:arg2];
        }
    }
}

static
void performCallbackOnMainThread(id objCallback, NSString* callbackFunction, id arg) {
    SEL func_selector = NSSelectorFromString(callbackFunction);
    if (objCallback) {
        if ([objCallback respondsToSelector:func_selector]) {
            [objCallback performSelectorOnMainThread:func_selector withObject:arg waitUntilDone:NO];
        }
    }
}

static
void performCallbackOnCurrentThread(id objCallback, NSString* callbackFunction, id arg) {
    SEL func_selector = NSSelectorFromString(callbackFunction);
    if (objCallback) {
        if ([objCallback respondsToSelector:func_selector]) {
            [objCallback performSelector:func_selector withObject:arg];
        }
    }
}


#endif