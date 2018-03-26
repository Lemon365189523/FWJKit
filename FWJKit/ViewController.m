//
//  ViewController.m
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+FWJ.h"
#import "NSString+FWJ.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImageView *iv = [[UIImageView alloc] init];
    iv.opaque = YES;
    iv.frame = CGRectMake(0, 50, 100, 100);
//    iv.backgroundColor = [UIColor blueColor];
    [iv fwj_cornerRadiusWithImage:[UIImage imageNamed:@"icon"] cornerRadius:10];
    [self.view addSubview:iv];
//    iv.image = [UIImage imageNamed:@"icon"];
    
    NSString *str = @"abc你我😉😉";
    NSLog(@"%ld",str.length);
    NSLog(@"%ld",[str fwj_includeEmojiLength]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
