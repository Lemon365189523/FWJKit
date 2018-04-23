//
//  NSObject+Runtime.m
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "NSObject+Runtime.h"


@implementation NSObject (Runtime)

-(NSString *)fwj_getClassName{
    const char *className = class_getName(self.class);
    
    return [NSString stringWithUTF8String:className];
}


-(NSString *)fwj_getSuperClassName{
    Class className = class_getSuperclass(self.class);
    
    return NSStringFromClass(className);
}


-(BOOL)fwj_isMetaClass{
    return class_isMetaClass(self.class);
}

-(size_t)fwj_getInstanceSize{
    //32位和64位系统中只有 long 和 指针 类型所占用的字节数不同
    return class_getInstanceSize(self.class);
}

-(Ivar)fwj_getIvarWithName:(NSString *)name{
    
    return class_getInstanceVariable(self.class, [name UTF8String]);
}

#pragma mark /////Ivar////////

-(NSString *)fwj_getIvarName:(Ivar)ivar{
    const char *name = ivar_getName(ivar);
    
    return [NSString stringWithUTF8String:name];
}



@end
