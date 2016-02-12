//
//  CoreTipView.m
//  CoreTipView
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "CoreTipView.h"
#import "CMPopTipView.h"
#import "CoreTipViewModel.h"


@interface CoreTipView ()<CMPopTipViewDelegate>

@property (nonatomic,strong) CMPopTipView *tipView;

@property (nonatomic,strong) NSMutableArray <CoreTipViewModel *> *tipViewModels;

@end

@implementation CoreTipView
HMSingletonM(CoreTipView)

+(void)initialize{

    CoreTipView *tipView = [CoreTipView sharedCoreTipView];
    [tipView tipViewPrepare];
}

-(CMPopTipView *)tipView{

    if(_tipView == nil){
    
        _tipView = [[CMPopTipView alloc] initWithTitle:nil message:nil];
    }
    
    return _tipView;
}





/*
 *  视图准备
 */
-(void)tipViewPrepare{
    
    self.tipView.has3DStyle = NO;
    self.tipView.hasGradientBackground = NO;
    self.tipView.hasShadow = NO;
    self.tipView.cornerRadius = 2;
    self.tipView.dismissAlongWithUserInteraction = YES;
    self.tipView.animation = CMPopTipAnimationSlide;
    self.tipView.pointerSize = 8;
    self.tipView.bubblePaddingX = 4;
    self.tipView.bubblePaddingY= 5;
    self.tipView.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    self.tipView.dismissTapAnywhere = YES;
    self.tipView.textFont = [UIFont systemFontOfSize:15];
    self.tipView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    self.tipView.borderWidth = 0.5;
    self.tipView.borderColor = [UIColor grayColor];
    self.tipView.titleColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    self.tipView.delegate = self;
}

+(void)presentPointingAtView:(UIView *)targetView inView:(UIView *)containerView title:(NSString *)title message:(NSString *)message animated:(BOOL)animated{

    CoreTipView *tipViewManager = [CoreTipView sharedCoreTipView];

    tipViewManager.tipView.title = title;
    tipViewManager.tipView.message = message;
    
    [tipViewManager.tipView presentPointingAtView:targetView inView:containerView animated:YES];
}

+(void)presentPointingAtBarButtonItem:(UIBarButtonItem *)barButtonItem title:(NSString *)title message:(NSString *)message animated:(BOOL)animated{

    CoreTipView *tipViewManager = [CoreTipView sharedCoreTipView];
    
    tipViewManager.tipView.title = title;
    tipViewManager.tipView.message = message;
    
    [tipViewManager.tipView presentPointingAtBarButtonItem:barButtonItem animated:YES];
}

+(void)dismissAnimated:(BOOL)animated{

    CoreTipView *tipViewManager = [CoreTipView sharedCoreTipView];
    [tipViewManager.tipView dismissAnimated:YES];
}


-(CoreTipView *(^)())prepare{

    return ^{
        
        self.tipViewModels = [NSMutableArray array];
        
        return self;
    };
}

-(CoreTipView *(^)(id target, UIView *contentView, NSString *title, NSString *message))add{
    
    return ^(id target, UIView *contentView, NSString *title, NSString *message){
        
        CoreTipViewModel * m =[CoreTipViewModel quick:target contentView: contentView title:title message:message];
        
        [self.tipViewModels addObject:m];
        
        return self;
    };
}

-(CoreTipView *(^)())show{

    return ^{
        
        [self showTipViewModel];
        
        return self;
    };
}

-(void)showTipViewModel{

    CoreTipViewModel *m = self.tipViewModels.firstObject;
    
    self.tipView.title = m.title;
    self.tipView.message = m.message;
    
    if([m.target isKindOfClass:[UIView class]]){
        
        [self.tipView presentPointingAtView:m.target inView:m.contentView animated:YES];
        
    }else {
        
        [self.tipView presentPointingAtBarButtonItem:m.target animated:YES];
    }
    
    [self.tipViewModels removeObject:m];
}


+(void)showTipViewsWithChainBlock:(void (^)(CoreTipView *))chainBlock{

    CoreTipView *tipViewManager = [CoreTipView sharedCoreTipView];

    tipViewManager.prepare();
    
    chainBlock(tipViewManager);
    
    tipViewManager.show();
}

-(void)popTipViewWasDismissedByUserSingleTap{
    
    if(self.tipViewModels.count == 0) return;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self showTipViewModel];
    });
}
-(void)popTipViewWasDismissedByUser:(CMPopTipView *)popTipView{}


@end
