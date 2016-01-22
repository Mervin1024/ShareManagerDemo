/*! \file $Id: UserAlertViewManager.m 20700 2012-07-06 04:27:24Z skh $
 * \author shikh
 * \brief 自定义AlertView
 */
//
//  UserAlertViewManager.m
//  controlclient
//
//  Created by shikh on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserAlertViewManager.h"

@implementation UserAlertViewManager

static UserAlertView* alertview = nil;

+ (void) showAlertViewWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction {
    
    if (alertview) {
        [alertview dismissWithClickedButtonIndex:0 animated:NO];
        alertview = nil;
    }
    alertview = [[UserAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles setCancelCallbackFunction:selectorCancelFunction setOtherCallbackFunction:selectorOtherFunction];            
    
    [alertview show];
}

// 生成自定义alertview
// delegate：设定回调类，不能为空
// setCancelCallbackFunction：设定回调类函数，不能为空
// setOtherCallbackFunction： 设定回调类函数，可为空，nil
// 如果other按钮没有，otherButtonTitles=nil
// 如果other按钮没有，selectorOtherFunction=nil
+ (void) showAlertViewWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle  otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction firstTextHolder:(NSString*)firstholder secondTextHolder:(NSString*)secondholder {
    
    if (alertview) {
        [alertview dismissWithClickedButtonIndex:0 animated:NO];
        alertview = nil;
    }
    
    alertview = [[UserAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles setCancelCallbackFunction:selectorCancelFunction setOtherCallbackFunction:selectorOtherFunction firstTextHolder:firstholder secondTextHolder:secondholder];            
    
    [alertview show];
}

+ (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex {
    if (alertview)
        return [alertview textFieldAtIndex:textFieldIndex];
    return nil;
}

+ (void) dismissAlertView {
    if (alertview) {
        [alertview dismissWithClickedButtonIndex:0 animated:NO];
        alertview = nil;
    }
}

@end
