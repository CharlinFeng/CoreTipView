//
//  CoreTipViewModel.h
//  CoreTipViewAdd
//
//  Created by 邓娟 on 16/2/9.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CoreTipViewModel : NSObject

@property (nonatomic,weak) id target;
@property (nonatomic,weak) UIView *contentView;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *message;

+(instancetype)quick:(id)target contentView:(UIView *)contentView title:(NSString *)title message:(NSString *)message;

@end
