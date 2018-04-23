//
//  NSObject+Runtime.h
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Runtime)

/*
     该分类只是用来加深对runtime在OC中起的作用，下面网址是讨论关于runtime的作用
     https://www.zhihu.com/question/30721573
     Peak大神的总结很好
 */


#pragma mark //////关于类对象（class isa）的方法///////
/**
 获取类名

 @return 返回类名字符串
 */
-(NSString *) fwj_getClassName;


/**
 获取父类类名

 @return 返回父类类名字符串
 */
-(NSString *) fwj_getSuperClassName;



/**
 判断当前对象是否是元类
 */
-(BOOL) fwj_isMetaClass;


/**
 是获取实例对象所占用内存的大小

 @return size_t 无符号整型
 */
-(size_t) fwj_getInstanceSize;


/**
 通过名字获取类中实例变量的结构体指针

 @param name 实例变量名字
 @return InstanceVariable
 */
-(Ivar) fwj_getIvarWithName:(NSString *) name;




#pragma mark /////Ivar(InstanceVariable实例变量)////////

/**
 获取实例变量的名字

 @param ivar 实例变量结构体指针
 @return 实例变量名字
 */
-(NSString *) fwj_getIvarName:(Ivar) ivar;

//-(void) fwj_getIvarTypeEncoding:(Ivar) ivar;
//
//-(int) fwj_getIvarOffset:(Ivar) ivar;


#pragma mark /////object(实例对象)//////


#pragma mark /////message(消息)//////

#pragma mark /////method(方法)///////

#pragma mark /////sel(selectors选择子)////////

#pragma mark /////protocol(协议)////////

#pragma mark /////properties(属性)//////

#pragma mark /////OC language features(语言特性)/////

@end
