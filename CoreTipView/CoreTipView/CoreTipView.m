//
//  CoreTipView.m
//  CoreTipView
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "CoreTipView.h"

@implementation CoreTipView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}



/*
 *  视图准备
 */
-(void)viewPrepare{
    
    self.has3DStyle = NO;
    self.hasGradientBackground = NO;
    self.hasShadow = NO;
    self.cornerRadius = 4;
    self.dismissAlongWithUserInteraction = YES;
    self.animation = CMPopTipAnimationSlide;
    self.pointerSize = 8;
    self.bubblePaddingX = 4;
    self.bubblePaddingY=5;
    self.textColor = [UIColor whiteColor];
    self.dismissTapAnywhere = YES;
    self.textFont = [UIFont systemFontOfSize:15];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.borderWidth = 0;
    
}

@end
