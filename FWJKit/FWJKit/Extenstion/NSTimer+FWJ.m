//
//  NSTimer+FWJ.m
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "NSTimer+FWJ.h"

@implementation NSTimer (FWJ)

+(NSTimer *)fwj_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{

    if (@available(iOS 10.0, *)) {
        //iOS10以后出该方法
        return [NSTimer scheduledTimerWithTimeInterval:interval repeats:repeats block:block];
    } else {
        return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(fwj_blockInvoke:) userInfo:[block copy] repeats:repeats];
    };

}

+(void) fwj_blockInvoke:(NSTimer *)timer{
    //把计时器要执行的任务封装到块里
    void (^block)(NSTimer *timer) = timer.userInfo;
    __weak NSTimer *weakTimer = timer;
    if (block) {
        block(weakTimer);
    }
}

@end
