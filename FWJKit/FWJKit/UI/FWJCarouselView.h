//
//  FWJCarouselView.h
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWJCarouselView : UIScrollView

@property (nonatomic, strong) NSArray *imageUrlArray;

@property (nonatomic, assign) NSInteger duration;

-(instancetype) initWithUrls:(NSArray *) urls duration:(NSInteger) duration;

@end
