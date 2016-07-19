//
//  UIViewController+JSHUD.h
//  MiyueiOS
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JSHUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)showProgressHUDCompleteMessage:(NSString *)message InView:(UIView *)view;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

- (void)showHint:(NSString *)hint withCustomView:(NSString *)imageName;

@end
