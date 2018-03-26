//
//  UIView+FWJ.m
//  FWJKit
//
//  Created by KADFWJ on 2018/3/26.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "UIView+FWJ.h"
#import <objc/runtime.h>

@interface UIView()

@property (nonatomic ,strong) NSMutableArray <UIView *>*fwj_subViews;

@end

@implementation UIView (ViewEvent)

static void fwj_addView(id array, id view){
    if (view && [array isKindOfClass:[NSMutableArray class]]) {
        [(NSMutableArray *)array addObject:view];
    }
}

+(void)load{
    Class cls = [self class];
    
    Method addsubViewM = class_getInstanceMethod(cls, @selector(addSubview:));
    Method fwj_addsubViewM = class_getInstanceMethod(cls, @selector(fwj_addSubview:));
    
    method_exchangeImplementations(addsubViewM, fwj_addsubViewM);
    
    
    Method insertViewM1 = class_getInstanceMethod(cls, @selector(insertSubview:atIndex:));
    Method fwj_insertViewM1 = class_getInstanceMethod(cls, @selector(fwj_insertSubview:atIndex:));
    method_exchangeImplementations(insertViewM1, fwj_insertViewM1);
    
    Method insertSubViewM1 = class_getInstanceMethod(cls, @selector(insertSubview:aboveSubview:));
    Method fwj_insertSubViewM1 = class_getInstanceMethod(cls, @selector(fwj_insertSubview:aboveSubview:));
    method_exchangeImplementations(insertSubViewM1, fwj_insertSubViewM1);
    
    Method insertSubViewM2 = class_getInstanceMethod(cls, @selector(insertSubview:belowSubview:));
    Method fwj_insertSubViewM2 = class_getInstanceMethod(cls, @selector(fwj_insertSubview:belowSubview:));
    method_exchangeImplementations(insertSubViewM2, fwj_insertSubViewM2);
}

-(void)fwj_viewEventWithName:(NSString *)eventName userInfo:(NSDictionary *)dic{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (UIView *subView in self.fwj_subViews) {
            if ([subView respondsToSelector:@selector(fwj_viewEventWithName:userInfo:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [subView fwj_viewEventWithName:eventName userInfo:dic];
                });
            }
        }
    });
}

-(void) fwj_addSubview:(UIView *) subView{
    fwj_addView(self.fwj_subViews, subView);
    [self fwj_addSubview:subView];
}

#pragma mark --Private
-(void) fwj_insertSubview:(UIView *) subView atIndex:(NSInteger )index{
    
    fwj_addView(self.fwj_subViews, subView);
    [self fwj_insertSubview:subView atIndex:index];
}

-(void) fwj_insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview{
  
    fwj_addView(self.fwj_subViews, view);
    [self fwj_insertSubview:view aboveSubview:siblingSubview];
}

-(void) fwj_insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview{
  
    fwj_addView(self.fwj_subViews, view);
    [self fwj_insertSubview:view belowSubview:siblingSubview];
}


-(NSMutableArray<UIView *> *)fwj_subViews{
    NSMutableArray *subViews = objc_getAssociatedObject(self, @selector(fwj_subViews));
    if (!subViews) {
        subViews = [NSMutableArray array];
        objc_setAssociatedObject(self, @selector(fwj_subViews), subViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return subViews;
}

-(void)setFwj_subViews:(NSMutableArray<UIView *> *)fwj_subViews{
    objc_setAssociatedObject(self, @selector(fwj_subViews), fwj_subViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark /////////////////////////////

