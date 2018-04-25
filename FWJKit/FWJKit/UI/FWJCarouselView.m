//
//  FWJCarouselView.m
//  FWJKit
//
//  Created by KADFWJ on 2018/4/23.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "FWJCarouselView.h"
#import "NSTimer+FWJ.h"

@interface FWJCarouselView()<UIScrollViewDelegate>
///显示当前图片
@property (nonatomic, strong) UIImageView *currentIV;
///显示下一张图片
@property (nonatomic, strong) UIImageView *nextIV;
///显示上一张图片
@property (nonatomic, strong) UIImageView *lastIV;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation FWJCarouselView{
    NSInteger _currentIndex ;
    BOOL _autoScroll;
}


-(instancetype)initWithUrls:(NSArray *)urls duration:(NSInteger)duration{
    if (self = [super init]) {
        self.imageUrlArray = urls;
        self.duration = duration;
    }
    
    return self;
}


#pragma mark private
-(void) p_startTimer{
    self->_autoScroll = YES;
    if (self.timer) {
        [self p_stopTimer];
    }
    self.timer = [NSTimer fwj_scheduledTimerWithTimeInterval:self.duration repeats:YES block:^(NSTimer *timer) {
        
    }];
}

-(void) p_stopTimer{
    if (self.timer) {
        [self.timer invalidate];
        _timer = nil;
    }
    
}

-(void) p_setScrollView{
    
}

-(void) p_setupImageViews{
    NSInteger nextIndex = [self p_getUrIndex:_currentIndex + 1];
    NSInteger lastIndex = [self p_getUrIndex:_currentIndex - 1];
    
}


///返回正常需要显示的index
-(NSInteger ) p_getUrIndex:(NSInteger) index{
    if (index == -1) {
        return self.imageUrlArray.count - 1;
    }else if (index == self.imageUrlArray.count){
        return 0;
    }else{
        return index;
    }
}

#pragma mark UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}


#pragma mark ///getter///

-(UIImageView *)currentIV{
    if (!_currentIV) {
        _currentIV = [[UIImageView alloc] init];
        _currentIV.userInteractionEnabled = YES;
        _currentIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _currentIV;
}

-(UIImageView *)lastIV{
    if (!_lastIV) {
        _lastIV = [[UIImageView alloc] init];
        _lastIV.userInteractionEnabled = YES;
        _lastIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _lastIV;
}

-(UIImageView *)nextIV{
    if (!_nextIV) {
        _nextIV = [[UIImageView alloc] init];
        _nextIV.userInteractionEnabled = YES;
        _nextIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _nextIV;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}

@end
