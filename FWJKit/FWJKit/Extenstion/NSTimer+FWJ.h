//
//  NSTimer+FWJ.h
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (FWJ)

+(NSTimer *) fwj_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block ;

@end
