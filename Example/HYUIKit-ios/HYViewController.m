//
//  HYViewController.m
//  HYUIKit-ios
//
//  Created by oceanfive on 11/27/2018.
//  Copyright (c) 2018 oceanfive. All rights reserved.
//

#import "HYViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "HYGeometry.h"
#import "UIView+HYCategory.h"
#import "MYView.h"

@interface HYViewController ()

@end

@implementation HYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    MYView *view = [[MYView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    view.frame = CGRectMake(0, 100, 100, 80);
    [self.view addSubview:view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view setNeedsDisplay];
    });
    
//    [UIApplication sharedApplication] keyWindow
//
//    UIImageView *myImageView = [[UIImageView alloc] init];
//    myImageView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:myImageView];
//    myImageView.frame = CGRectMake(0.5, 0.1, 100.15, 100.95);
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [myImageView hy_alignRect];
//    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
