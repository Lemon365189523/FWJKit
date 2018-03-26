//
//  NSString+FWJ.m
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "NSString+FWJ.h"

@implementation NSString (FWJ)

- (NSUInteger) fwj_includeEmojiLength
{
   
    NSInteger emojiLength = [self fwj_emojiLength];
    NSInteger length = self.length;
    if (emojiLength > 0) {
        length = length - emojiLength;
    }

    return length;
}

-(NSInteger) fwj_emojiLength{
    __block NSInteger num = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    num++;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                num++;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                num++;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                num++;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                num++;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                num++;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                num++;
            }
        }
    }];
    return num;
}

@end
