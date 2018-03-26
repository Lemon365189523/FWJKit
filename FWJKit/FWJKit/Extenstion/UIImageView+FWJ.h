//
//  UIImageView+FWJ.h
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (FWJConrnerRedius)


/**
 为图片设置圆角

 @param image 传入图片
 @param cornerRadius 圆角
 */
-(void) fwj_cornerRadiusWithImage:(UIImage *) image cornerRadius:(CGFloat)cornerRadius;


@end
