//
//  UILabel+HYCateogry.m
//  StudyAnimation
//
//  Created by ocean on 2018/12/6.
//  Copyright © 2018 ocean. All rights reserved.
//

#import "UILabel+HYCateogry.h"

@implementation UILabel (HYCateogry)

- (void)hy_addGradientEffectWithColors:(NSArray<UIColor *> *)colors
                            startPoint:(CGPoint)startPoint
                              endPoint:(CGPoint)endPoint {
    
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgColors addObject:(id)[color CGColor]];
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = cgColors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = self.frame;
    [self.superview.layer addSublayer:gradientLayer];
    gradientLayer.mask = self.layer; // 设置遮罩mask，重叠部分，alpha>0 显示
    self.frame = gradientLayer.bounds; // 设置mask之后，frame会变化，需要重新设置
    /**
     @discussion:
     下面的设置是无效的
     self.frame = gradientLayer.frame
     */
}

@end
