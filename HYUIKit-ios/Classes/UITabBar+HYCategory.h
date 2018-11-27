//
//  UITabBar+HYCategory.h
//  HaiZiGuoParents
//
//  Created by ocean on 2018/11/27.
//  Copyright © 2018 MyWay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (HYCategory)

/// 查找索引 index 对应 TabBarButton
- (nullable UIControl *)hy_findTabBarButtonAtIndex:(NSInteger)index;
/// 查找索引 index 对应 ImageView
- (nullable UIImageView *)hy_findImageViewAtIndex:(NSInteger)index;
/// 查找索引 index 对应 Label
- (nullable UILabel *)hy_findLabelAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
