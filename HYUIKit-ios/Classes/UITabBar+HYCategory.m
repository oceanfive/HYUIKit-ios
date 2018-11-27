//
//  UITabBar+HYCategory.m
//  HaiZiGuoParents
//
//  Created by ocean on 2018/11/27.
//  Copyright © 2018 MyWay. All rights reserved.
//

#import "UITabBar+HYCategory.h"

@implementation UITabBar (HYCategory)

- (nullable UIControl *)hy_findTabBarButtonAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.items.count) {
        return nil;
    }
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")] && [subview isKindOfClass:[UIControl class]]) {
            [tabBarButtonArray addObject:(UIControl *)subview];
        }
    }
    if (index < 0 || index >= tabBarButtonArray.count) {
        return nil;
    }
    return [tabBarButtonArray objectAtIndex:index];
}

- (nullable UIImageView *)hy_findImageViewAtIndex:(NSInteger)index {
    UIControl *control = [self hy_findTabBarButtonAtIndex:index];
    if (!control) return nil;
    UIImageView *imageView;
    for (UIView *subview in control.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")] && [subview isKindOfClass:[UIImageView class]]) {
            imageView = (UIImageView *)subview;
            break;
        }
    }
    return imageView;
}

- (nullable UILabel *)hy_findLabelAtIndex:(NSInteger)index {
    UIControl *control = [self hy_findTabBarButtonAtIndex:index];
    if (!control) return nil;
    UILabel *label;
    for (UIView *subview in control.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")] && [subview isKindOfClass:[UILabel class]]) {
            label = (UILabel *)subview;
            break;
        }
    }
    return label;
}

@end
