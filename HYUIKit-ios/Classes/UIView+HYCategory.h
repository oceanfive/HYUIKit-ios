//
//  UIView+HYCategory.h
//  HYUIKit-ios_Example
//
//  Created by ocean on 2019/1/22.
//  Copyright © 2019 oceanfive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HYCategory)

/**
 对齐 frame，向正无穷进位取整
 */
- (void)hy_alignRect;

@end

NS_ASSUME_NONNULL_END
