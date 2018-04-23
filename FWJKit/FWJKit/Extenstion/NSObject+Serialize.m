//
//  NSObject+FWJ.m
//  FWJKit
//
//  Created by KADFWJ on 2018/3/28.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "NSObject+Serialize.h"
#import <objc/runtime.h>

@implementation NSObject (Serialize)
-(void)fwj_decode:(NSCoder *)decoder{
    Class cs = [self class];
    while (cs != [NSObject class]) {
        BOOL isMySelf = (cs == [self class]);
        unsigned int varCount;
        unsigned int propertyCount;
        //　1.获取类成员变量列表，count为类成员变量数量
        Ivar *vars = class_copyIvarList([self class], &varCount);
        objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
        NSString *key = nil;
        unsigned count = isMySelf ? varCount : propertyCount;
        for (int i = 0; i < count; i++) {
            // 2.根据索引获得指定位置的成员变量                 // 3.获得成员变量名
            const char *name = isMySelf ? ivar_getName(vars[i]) : property_getName(propertys[i]);
            // 4.成员变量名转化成oc字符串
            key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [decoder decodeObjectForKey: key];
            if (!value) continue;
            [self setValue:value forKey:key];
        }
        free(vars);
        free(propertys);
        cs = class_getSuperclass(cs);
    }
    
}

-(void)fwj_encode:(NSCoder *)encoder{
    Class cs = [self class];
    while (cs != [NSObject class]) {
        BOOL isMyself = (cs == [self class]);
        unsigned int varsCount;
        unsigned int propertyCount;
        Ivar *vars = class_copyIvarList([self class], &varsCount);
        objc_property_t *propertys = class_copyPropertyList(cs, &propertyCount);
        NSString *key = nil;
        unsigned int count = isMyself ? varsCount : propertyCount;
        for (int i = 0; i < count; i ++) {
            const char *name = isMyself ? ivar_getName(vars[i]) : property_getName(propertys[i]);
            key = [NSString stringWithCString: name encoding:NSUTF8StringEncoding];
            id value = [self valueForKey: key];
            if (!value) continue;
            [encoder encodeObject:value forKey: key];
        }
        free(vars);
        free(propertys);
        cs = class_getSuperclass(cs);
    }
}

-(id)fwj_copyWithZone:(NSZone *)zone{
    Class cs = [self class];
    id oj;
    while (cs != [NSObject class]) {
        oj = [[cs allocWithZone:zone] init];
        BOOL isMyself = (cs == [self class]);
        unsigned int varsCount;
        unsigned int propertyCount;
        Ivar *vars = class_copyIvarList([self class], &varsCount);
        objc_property_t *propertys = class_copyPropertyList(cs, &propertyCount);
        NSString *key = nil;
        unsigned int count = isMyself ? varsCount : propertyCount;
        for (int i = 0; i < count; i++) {
            const char *name = isMyself ? ivar_getName(vars[i]) : property_getName(propertys[i]);
            key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [self valueForKey:key];
            [oj setValue:[value copy] forKey:key];
        }
        free(vars);
        free(propertys);
        cs = class_getSuperclass(cs);
    }
    return oj;
}
@end
