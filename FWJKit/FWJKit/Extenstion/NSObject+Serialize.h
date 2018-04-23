//
//  NSObject+FWJ.h
//  FWJKit
//
//  Created by KADFWJ on 2018/3/28.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Serialize)

///解码
-(void) fwj_decode:(NSCoder *)decoder;

///编码
-(void) fwj_encode:(NSCoder *) encoder;

///深拷贝
-(id) fwj_copyWithZone:(NSZone *) zone;


/**
 .m直接使用的宏 省略代码
 */
#define FWJ_CODING() \
- (instancetype)initWithCoder:(NSCoder *)aDecoder { \
    self = [super init]; \
    [self fwj_decode:aDecoder]; \
    return self; \
} \
- (void)encodeWithCoder:(NSCoder *)coder    \
{   \
    [self fwj_encode:coder];\
}   \


#define FWJ_COPY()   \
- (id)copyWithZone:(NSZone *)zone { \
    return [self fwj_copyWithZone:zone];\
}   \


@end
