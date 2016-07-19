//
//  UIViewController+JSSpinkit.m
//  MiyueiOS
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 Cary. All rights reserved.
//

#define kDefaultColor COLORSTRING(@"dddddd")

#import "UIViewController+JSSpinkit.h"
#import <objc/runtime.h>

static const void *HttpRequestSpinKitHUDKey = &HttpRequestSpinKitHUDKey;
@implementation UIViewController (JSSpinkit)

- (RTSpinKitView *)SpinKitHUD{
    return objc_getAssociatedObject(self, HttpRequestSpinKitHUDKey);
}
- (void)setSpinKitHUD:(RTSpinKitView *)SpinKitHUD{
    objc_setAssociatedObject(self, HttpRequestSpinKitHUDKey, SpinKitHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showSpinKitHudInView:(UIView *)view{
    //RTSpinKitViewStyleArc
    //RTSpinKitViewStyleWordPress
    //RTSpinKitViewStyleChasingDots
    [self showSpinKitHudInView:view style:RTSpinKitViewStyleArc];
}

- (void)showSpinKitHudInView:(UIView *)view yOffset:(float)yOffset{
    [self showSpinKitHudInView:view style:RTSpinKitViewStyleArc color:kDefaultColor yOffset:yOffset];
}

- (void)showSpinKitHudInView:(UIView *)view maskView:(BOOL)mask{
    
}

- (void)showSpinKitHudInView:(UIView *)view style:(RTSpinKitViewStyle)style{
    [self showSpinKitHudInView:view style:style color:kDefaultColor];
}

- (void)showSpinKitHudInView:(UIView *)view style:(RTSpinKitViewStyle)style color:(UIColor *)color{
    if (!view) {
        //view尽量传值 不然直接添加在keywindow上
        view = [UIApplication sharedApplication].keyWindow;
    }
    CGRect viewBounds = view.bounds;
    RTSpinKitView *spinner = [[RTSpinKitView alloc] initWithStyle:style color:color];
    spinner.center = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds));
    [view addSubview:spinner];
    [spinner bringSubviewToFront:view];
    [spinner startAnimating];
    [self setSpinKitHUD:spinner];
}

- (void)showSpinKitHudInView:(UIView *)view style:(RTSpinKitViewStyle)style color:(UIColor *)color yOffset:(float)yOffset{
    if (!view) {
        //view尽量传值 不然直接添加在keywindow上
        view = [UIApplication sharedApplication].keyWindow;
    }
    CGRect viewBounds = view.bounds;
    RTSpinKitView *spinner = [[RTSpinKitView alloc] initWithStyle:style color:color];
    spinner.center = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds)-yOffset);
    [view addSubview:spinner];
    [spinner bringSubviewToFront:view];
    [spinner startAnimating];
    [self setSpinKitHUD:spinner];
}

- (void)hideSpinKitHud{
    //停止转菊花
    [[self SpinKitHUD] hide:YES];
    //将HUD从父视图移除
    [[self SpinKitHUD] removeFromSuperview];
}

@end
