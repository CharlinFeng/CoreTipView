//
//  CoreTipViewModel.m
//  CoreTipViewAdd
//
//  Created by 邓娟 on 16/2/9.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "CoreTipViewModel.h"

@implementation CoreTipViewModel


+(instancetype)quick:(id)target contentView:(UIView *)contentView title:(NSString *)title message:(NSString *)message{

    CoreTipViewModel *m = [CoreTipViewModel new];
    
    m.target = target;
    m.contentView = contentView;
    m.title = title;
    m.message = message;
    
    return m;
}


@end
