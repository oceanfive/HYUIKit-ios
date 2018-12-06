//
//  UILabel+HYCateogry.h
//  StudyAnimation
//
//  Created by ocean on 2018/12/6.
//  Copyright © 2018 ocean. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (HYCateogry)

/**
 添加渐变效果

 @param colors 颜色数组
 @param startPoint 开始的点
 @param endPoint 结束的点
 
 startPoint 和 endPoint，参考 UIColor+HYCategory.h 中的描述
 
 [0,0]------[1,0]
 |          |
 |          |
 |          |
 [0,1]------[1,1]
 
 */
- (void)hy_addGradientEffectWithColors:(NSArray <UIColor *> *)colors
                            startPoint:(CGPoint)startPoint
                              endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
