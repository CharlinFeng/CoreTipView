//
//  ViewController.m
//  CoreTipView
//
//  Created by 冯成林 on 16/1/3.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CoreTipView.h"

@interface ViewController ()

@property (nonatomic,strong) CoreTipView *tipView;

@property (weak, nonatomic) IBOutlet UIButton *btn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipView = [CoreTipView new];
    self.tipView.message = @"这是一个按钮";

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [self.tipView presentPointingAtView:self.btn inView:self.view animated:YES];
    });
}








@end
