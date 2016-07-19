//
//  ViewController.m
//  Demo
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 Cary. All rights reserved.
//

#import "ViewController.h"
#import "CategoryFiles.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action1:(id)sender {
    NSString * str = @"AASASAS";
    BOOL isHave = [str isChinese];
}

@end
