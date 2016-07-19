//
//  UIViewController+JSHUD.m
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import "UIViewController+JSHUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (JSHUD)


- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    HUD.mode = MBProgressHUDModeIndeterminate;
    //    HUD.dimBackground = YES;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}

- (void)showProgressHUDCompleteMessage:(NSString *)message InView:(UIView *)view{
    if (message) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MWPhotoBrowser.bundle/images/Checkmark.png"]];
        hud.labelText = message;
        hud.mode = MBProgressHUDModeCustomView;
        [hud hide:YES afterDelay:1.5];
    }
    self.navigationController.navigationBar.userInteractionEnabled = YES;
}

- (void)showHint:(NSString *)hint{
    [self showHint:hint yOffset:0.0f];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    if ([GlobalData sharedInstance].lastShowHintDate) {
        NSDate * lastDate = [GlobalData sharedInstance].lastShowHintDate;
        NSTimeInterval timeInterval = [[NSDate date]
                                       timeIntervalSinceDate:lastDate];
        if (timeInterval<2.0f) {
            return;
        }
    }
    [GlobalData sharedInstance].lastShowHintDate = [NSDate date];
    
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 15.f;
    hud.labelFont = [UIFont systemFontOfSize:14];
//    hud.minSize = CGSizeMake(150, 30);
    hud.yOffset = IS_IPHONE_5?200.f:150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint withCustomView:(NSString *)imageName{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    UIImageView * customImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    hud.customView = customImageView;
    customImageView = nil;
    hud.mode = MBProgressHUDModeCustomView;
    hud.userInteractionEnabled = NO;
    hud.labelText = hint;
    hud.labelFont = [UIFont systemFontOfSize:14];
    hud.margin = 30.f;
    hud.yOffset = IS_IPHONE_5?50.f:0.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)hideHud{
    //停止转菊花
    [[self HUD] hide:YES];
    //将HUD从父视图移除
    [[self HUD] removeFromSuperview];
}

@end
