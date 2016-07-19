//
//  UIViewController+JSSpinkit.h
//  MiyueiOS
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTSpinKitView.h"

@interface UIViewController (JSSpinkit)

//设置SpinKitHud view传nil则添加在keyWindow上
- (void)showSpinKitHudInView:(UIView *)view;
- (void)showSpinKitHudInView:(UIView *)view yOffset:(float)yOffset;
/**
 *  设置SpinKitHud
 *
 *  @param view view
 *  @param mask 是否需要蒙版
 */
- (void)showSpinKitHudInView:(UIView *)view
                    maskView:(BOOL)mask;

- (void)showSpinKitHudInView:(UIView *)view
                       style:(RTSpinKitViewStyle)style;
/**
 *  添加SpinKitHud
 *
 *  @param view  view 可以传nil
 *  @param style RTSpinKitViewStyle
 *  @param color color
 */
- (void)showSpinKitHudInView:(UIView *)view
                       style:(RTSpinKitViewStyle)style
                       color:(UIColor *)color;

/**
 *  隐藏SpinKitHudView
 */
- (void)hideSpinKitHud;

@end
