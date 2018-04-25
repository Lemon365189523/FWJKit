//
//  FWJMacro.h
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#ifndef FWJMacro_h
#define FWJMacro_h

//单例化一个类
#define FWJ_SHARED_CLASS(classname) \
\
+ (classname *)shared##classname \
{ \
    static classname *shared##classname = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        shared##classname = [[self alloc] init];\
    }\
    return shared##classname; \
} \
\


#endif /* FWJMacro_h */
