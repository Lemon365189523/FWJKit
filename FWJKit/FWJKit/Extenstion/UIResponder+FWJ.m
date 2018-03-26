//
//  UIResponder+FWJ.m
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "UIResponder+FWJ.h"

@implementation UIResponder (ResponderEvent)

-(void)fwj_eventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    [[self nextResponder] fwj_eventWithName:eventName userInfo:userInfo];
}

@end
