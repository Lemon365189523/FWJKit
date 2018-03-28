//
//  NSString+FWJ.h
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FWJ)

/**
 包含Emoji的文本字字符串个数

 @return 返回字符串长度
 */
- (NSUInteger)fwj_includeEmojiLength;


/**
  返回字符中包含多少个emoji
 */
-(NSInteger ) fwj_emojiLength;

@end
