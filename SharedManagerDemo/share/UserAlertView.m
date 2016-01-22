/*! \file $Id: UserAlertView.m 20971 2012-08-01 05:42:29Z skh $
 * \author shikh
 * \brief 自定义AlertView
 */
//
//  UserAlertView.m
//  controlclient
//
//  Created by shikh on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserAlertView.h"
#import "PerformCallback.h"

@interface UserAlertView(){
    __weak id delegateCallback;  //回调类
    NSString* cancelCallbackFunction;   //cancel回调函数
    NSString* otherCallbackFunction;    //other回调函数
    
    NSString* firstTextHolder;
    NSString* secondTextHolder;
}
@end

@implementation UserAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle  otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction {
    //初始化
    self =[super initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    self.delegate = self;
    //设置回调类与回调函数
    if (self) {
        delegateCallback = delegate;
        otherCallbackFunction  = selectorOtherFunction;
        cancelCallbackFunction = selectorCancelFunction;
        firstTextHolder = nil;
        secondTextHolder = nil;
    }    
    return self;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles setCancelCallbackFunction:(NSString*) selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction firstTextHolder:(NSString*)firstholder secondTextHolder:(NSString*)secondholder {
    //初始化
    self =[super initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    self.delegate = self;
    //设置回调类与回调函数
    if (self) {
        delegateCallback = delegate;
        otherCallbackFunction  = selectorOtherFunction;
        cancelCallbackFunction = selectorCancelFunction;
        firstTextHolder = firstholder;
        secondTextHolder = secondholder;
    }   
    
    self.alertViewStyle = UIAlertViewStyleSecureTextInput;
    if (firstholder != nil)
        [[self textFieldAtIndex:0]setPlaceholder:firstholder]; 
    if (secondholder != nil)
        [[self textFieldAtIndex:1]setPlaceholder:secondholder];
    
    return self;
}


- (void) show {
    if (self) {
        if (!self.isVisible) {
            [super show];
        } 
    }
}

- (void) alertViewCancel:(UIAlertView *)alertView {
    if (self) {
        performCallback(delegateCallback, cancelCallbackFunction, nil, nil);
    }
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self) {
        if (buttonIndex == self.firstOtherButtonIndex) {
            performCallback(delegateCallback, otherCallbackFunction, nil, nil);
        } else {
            performCallback(delegateCallback, cancelCallbackFunction, nil, nil);
        }

    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    if (firstTextHolder)
        return ([alertView textFieldAtIndex:0].text && ![[alertView textFieldAtIndex:0].text isEqualToString:@""]);
    return YES;
}

- (void) setDelegateObject:(id)delegateObject setCancelCallbackFunction:(NSString *)selectorCancelFunction setOtherCallbackFunction:(NSString *)selectorOtherFunction {
    if (self) {
        delegateCallback = delegateObject;
        otherCallbackFunction  = selectorOtherFunction;
        cancelCallbackFunction = selectorCancelFunction;
    }
}

@end
