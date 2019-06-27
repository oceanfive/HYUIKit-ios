//
//  HYNavigationController.m
//  HYUIKit-ios_Example
//
//  Created by ocean on 2019/6/12.
//  Copyright © 2019 oceanfive. All rights reserved.
//

#import "HYNavigationController.h"

@interface HYNavigationController ()

@end

@implementation HYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 全局控制push的时候隐藏标签栏
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
