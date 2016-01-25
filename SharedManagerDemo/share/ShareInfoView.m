//
//  ShareInfoView.m
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "ShareInfoView.h"

@interface ShareInfoView () <SharedManagerDelegate> {
    UIViewController *superViewController;
    UIView *containerView;
    SharedManager *sharedManager;
}

@end

@implementation ShareInfoView
static CGFloat containerViewHeight = 200;
- (instancetype)init{
    if ((self = [super initWithFrame:SCREEN_BOUNDS])) {
        UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissShareInfoView)];
        [self addGestureRecognizer:tap];
        self.backgroundColor = [UIColor clearColor];
        [self addViews];
        sharedManager = [SharedManager manager];
        sharedManager.delegate = self;
    }
    return self;
}

- (void)addViews{
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, -containerViewHeight, SCREEN_WIDTH, containerViewHeight)];
    containerView.backgroundColor = [UIColor lightGrayColor];
    UIButton *buttonQQ = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, 60, 40)];
    [buttonQQ addTarget:self action:@selector(shareToQQ:) forControlEvents:UIControlEventTouchUpInside];
    [buttonQQ setTitle:@"扣扣" forState:UIControlStateNormal];
    
    UIButton *buttonWB = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-20-60, 60, 60, 40)];
    [buttonWB addTarget:self action:@selector(shareToSinaWeibo:) forControlEvents:UIControlEventTouchUpInside];
    [buttonWB setTitle:@"围脖" forState:UIControlStateNormal];
    [containerView addSubview:buttonQQ];
    [containerView addSubview:buttonWB];
    [self addSubview:containerView];
}

- (void)shareToQQ:(id)sender{
    [sharedManager postShareInformation:[self sharedObjFromDataSource] toPlatform:SharedPlatformForQQ];
}

- (void)shareToSinaWeibo:(id)sender{
    [sharedManager postShareInformation:[self sharedObjFromDataSource] toPlatform:SharedPlatformForSinaMicroblog];
}

- (SharedObject *)sharedObjFromDataSource{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(sharedObject)]) {
        return [self.dataSource sharedObject];
    }
    return nil;
}

- (void)showShareInfoViewInSuperView:(UIView *)superView andViewController:(UIViewController *)viewController{
    [superView addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        containerView.center = CGPointMake(SCREEN_WIDTH/2, containerViewHeight/2);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.2 animations:^{
                self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            }];
        }
    }];
}

- (void)dismissShareInfoView{
    self.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:0.3 animations:^{
        containerView.center = CGPointMake(SCREEN_WIDTH/2, -containerViewHeight/2);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

#pragma mark - SharedManager Delegate
- (void)sinaWBShareSucceed{
    NSLog(@"分享成功");
}

- (void)sinaWBShareFailed{
    NSLog(@"分享失败");
}

@end
