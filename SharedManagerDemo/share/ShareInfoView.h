//
//  ShareInfoView.h
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedManager.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)

@protocol ShareInfoDataSource <NSObject>

- (SharedObject *)sharedObject;

@end

@interface ShareInfoView : UIView <SharedManagerDelegate>

@property (nonatomic, weak) id<ShareInfoDataSource> dataSource;

- (void)showShareInfoViewInSuperView:(UIView *)superView andViewController:(UIViewController *)viewController;
- (void)dismissShareInfoView;

@end
