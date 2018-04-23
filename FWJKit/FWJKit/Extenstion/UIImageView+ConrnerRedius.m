//
//  UIImageView+FWJ.m
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "UIImageView+ConrnerRedius.h"

@implementation UIImageView (ConrnerRedius)

-(void) fwj_cornerRadiusWithImage:(UIImage *) image cornerRadius:(CGFloat)cornerRadius{
    
    if([UIDevice currentDevice].systemVersion.doubleValue >= 9.0){
        //png图片UIImageView处理圆角是不会产生离屏渲染的。（ios9.0之后不会离屏渲染，ios9.0之前还是会离屏渲染）。
        self.image = image;
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
    }else{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            CGSize size = self.bounds.size;
            CGFloat scale = [UIScreen mainScreen].scale;
           
            UIGraphicsBeginImageContextWithOptions(size, YES, scale);
            
            UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
            [cornerPath addClip];
            
            [image drawInRect:self.bounds];
            
            UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.image = processedImage;
        });
        
        
    }

    
}

@end
