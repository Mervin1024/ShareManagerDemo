//
//  ShareInfoView.m
//  SharedManagerDemo
//
//  Created by sh219 on 16/1/22.
//  Copyright © 2016年 sh219. All rights reserved.
//

#import "ShareInfoView.h"

@interface ShareInfoView (){
    UIViewController *superViewController;
    UIView *containerView;
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
    }
    return self;
}

- (void)addViews{
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, -containerViewHeight, SCREEN_WIDTH, containerViewHeight)];
    containerView.backgroundColor = [UIColor lightGrayColor];
    UIButton *buttonQQ = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 60, 40)];
    [buttonQQ addTarget:self action:@selector(shareToQQ:) forControlEvents:UIControlEventTouchUpInside];
    [buttonQQ setTitle:@"扣扣" forState:UIControlStateNormal];
    
    UIButton *buttonWB = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-20-60, 20, 60, 40)];
    [buttonWB addTarget:self action:@selector(shareToWeibo:) forControlEvents:UIControlEventTouchUpInside];
    [buttonWB setTitle:@"围脖" forState:UIControlStateNormal];
    [containerView addSubview:buttonQQ];
    [containerView addSubview:buttonWB];
    [self addSubview:containerView];
}

- (void)shareToQQ:(id)sender{
    
}

- (void)shareToWeibo:(id)sender{
    
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

@end
