//
//  UIView+FWJ.h
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (ViewEvent)


/**
 view的事件传递 父view传到subView 可跨层传递
 注意subView要在发送消息前加入到父view中
 
 @param eventName 事件标识
 @param dic 需要传递的数据
 */
-(void) fwj_viewEventWithName:(NSString *) eventName userInfo:(NSDictionary *)dic;


@end
