/*! \file $Id: UserAlertViewManager.h 20700 2012-07-06 04:27:24Z skh $
 * \author shikh
 * \brief 自定义AlertView
 */
//
//  UserAlertViewManager.h
//  controlclient
//
//  Created by shikh on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAlertView.h"

@interface UserAlertViewManager : NSObject

// 生成自定义alertview
// delegate：设定回调类，不能为空
// setCancelCallbackFunction：设定回调类函数，不能为空
// setOtherCallbackFunction： 设定回调类函数，可为空，nil
// 如果other按钮没有，otherButtonTitles=nil
// 如果other按钮没有，selectorOtherFunction=nil
+ (void) showAlertViewWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle  otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction;

// 生成自定义alertview
// delegate：设定回调类，不能为空
// setCancelCallbackFunction：设定回调类函数，不能为空
// setOtherCallbackFunction： 设定回调类函数，可为空，nil
// 如果other按钮没有，otherButtonTitles=nil
// 如果other按钮没有，selectorOtherFunction=nil
+ (void) showAlertViewWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle  otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction firstTextHolder:(NSString*)firstholder secondTextHolder:(NSString*)secondholder;

+ (UITextField *)textFieldAtIndex:(NSInteger)textFieldIndex ;

// dismiss 
+ (void) dismissAlertView;

@end
