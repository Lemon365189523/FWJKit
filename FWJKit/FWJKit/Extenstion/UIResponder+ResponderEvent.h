//
//  UIResponder+FWJ.h
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (ResponderEvent)

/**
 事件传递 从view->vc->window 可跨层处理事件和过滤事件

 @param eventName 事件标识
 @param userInfo 传递的数据
 */
- (void)fwj_eventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
