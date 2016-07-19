//
//  UIViewController+Category.m
//  MiyueiOS
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 com.myjhealth. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)callActionWithNumber:(id)number{
    NSString *num = [[NSString alloc]initWithFormat:@"tel://%@",number]; //number为号码字符串
    //    NSString *num = [[NSString alloc]initWithFormat:@"telprompt://%@",number]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
}

- (void)callActionWithNumber:(id)number showInView:(UIView *)view{
    NSMutableString * num = [[NSMutableString alloc] initWithFormat:@"tel:%@",number];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:num]]];
    [view addSubview:callWebview];
}

//弹出视频播放器
- (void)createMPPlayerController:(NSString *)sFileNamePath{
    NSString * url = sFileNamePath;
    NSURL *videoUrl=[NSURL URLWithString:url];
    MPMoviePlayerViewController *moviePlayer =[[MPMoviePlayerViewController alloc] initWithContentURL:videoUrl];
    CGAffineTransform landscapeTransform = CGAffineTransformMakeRotation(M_PI / 2);
    moviePlayer.view.transform = landscapeTransform;
    [moviePlayer.moviePlayer play];
    [self presentMoviePlayerViewControllerAnimated:moviePlayer]; // 这里是presentMoviePlayerViewControllerAnimated
    [moviePlayer.moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
    [moviePlayer.view setBackgroundColor:[UIColor clearColor]];
    [moviePlayer.view setFrame:self.view.bounds];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer.moviePlayer];
}
-(void)movieFinishedCallback:(NSNotification*)notify{
    // 视频播放完或者在presentMoviePlayerViewControllerAnimated下的Done按钮被点击响应的通知。
    MPMoviePlayerController* theMovie = [notify object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMovie];
    [self dismissMoviePlayerViewControllerAnimated];
}

@end
