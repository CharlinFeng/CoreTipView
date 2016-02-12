//
//  CoreTipView.h
//  CoreTipView
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoreTipViewSingleton.h"

@interface CoreTipView : NSObject

HMSingletonH(CoreTipView)


+(void)presentPointingAtView:(UIView *)targetView inView:(UIView *)containerView title:(NSString *)title message:(NSString *)message animated:(BOOL)animated;
+(void)presentPointingAtBarButtonItem:(UIBarButtonItem *)barButtonItem title:(NSString *)title message:(NSString *)message animated:(BOOL)animated;

+(void)dismissAnimated:(BOOL)animated;

+(void)showTipViewsWithChainBlock:(void(^)(CoreTipView *tipView))chainBlock;

-(CoreTipView *(^)(id target, UIView *contentView, NSString *title, NSString* message))add;

@end
