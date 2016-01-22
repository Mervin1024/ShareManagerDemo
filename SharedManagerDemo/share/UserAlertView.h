/*! \file $Id: UserAlertView.h 20700 2012-07-06 04:27:24Z skh $
 * \author shikh
 * \brief 自定义AlertView
 */
//
//  UserAlertView.h
//  controlclient
//
//  Created by shikh on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIAlertView.h>

@interface UserAlertView : UIAlertView

// 初始化方法
// delegate：设定回调类，可为空
// setCancelCallbackFunction：设定回调类函数，可为空，nil
// setOtherCallbackFunction： 设定回调类函数，可为空，nil
// 如果cancel按钮没有，cancelButtonTitles=nil
// 如果cancel按钮没有，selectorCancelFunction=nil
// 如果other按钮没有，otherButtonTitles=nil
// 如果other按钮没有，selectorOtherFunction=nil
- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction;

// 初始化方法
// delegate：设定回调类，可为空
// setCancelCallbackFunction：设定回调类函数，可为空，nil
// setOtherCallbackFunction： 设定回调类函数，可为空，nil
// 如果cancel按钮没有，cancelButtonTitles=nil
// 如果cancel按钮没有，selectorCancelFunction=nil
// 如果other按钮没有，otherButtonTitles=nil
// 如果other按钮没有，selectorOtherFunction=nil
- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction firstTextHolder:(NSString*)firstholder secondTextHolder:(NSString*)secondholder;


// 设定回调类与回调类函数
// 如果cancel按钮没有，selectorCancelFunction=nil
// 如果other按钮没有，selectorOtherFunction=nil
- (void)setDelegateObject:(id)delegateObject setCancelCallbackFunction:(NSString *)selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction;

@end

