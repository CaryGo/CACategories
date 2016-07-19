//
//  UIViewController+Category.h
//  MiyueiOS
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 com.myjhealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

//call phone
- (void)callActionWithNumber:(id)number;

//call phone in view
- (void)callActionWithNumber:(id)number showInView:(UIView *)view;

//弹出视频播放器 present player in self view
- (void)createMPPlayerController:(NSString *)sFileNamePath;

@end
