//
//  UIColor+HYCategory.m
//  Category
//
//  Created by wuhaiyang on 16/8/25.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import "UIColor+HYCategory.h"

@implementation UIColor (HYCategory)

#pragma mark - 获取颜色的三基色
- (CGFloat)hy_red {
    CGFloat r = 0, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)hy_green {
    CGFloat r, g = 0, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)hy_blue {
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

- (CGFloat)hy_alpha {
    return CGColorGetAlpha(self.CGColor);
}

+ (UIImage *)hy_createImageWithColor:(UIColor *)color
                                size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 十六进制颜色
+ (UIColor *)hy_colorWithHex:(NSInteger)hexValue {
    return [self hy_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)hy_colorWithHex:(NSInteger)hexValue
                       alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hexValue & 0xFF)) / 255.0
                           alpha:alphaValue];
    /*
     @discussion
     1、原理：十六进制颜色--分解为三基色、使用三基色获取颜色的方法
     2、十六进制中，0xffa0ca，前两位代表红色、中间两位代表绿色、后两位代表蓝色；
     3、使用“与运算“和”移位运算“获取到十六进制颜色中的红、绿、蓝的元素成分
     4、调用三基色获取颜色的方法
     */
}

+ (UIColor *)hy_randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0
                           green:arc4random_uniform(256) / 255.0
                            blue:arc4random_uniform(256) / 255.0
                           alpha:1.0];
}

#pragma mark - 渐变颜色效果
+ (UIColor *)hy_gradientColorWith:(HYGradientColorDirection)direction
                           colors:(NSArray<UIColor *> *)colors
                             size:(CGSize)size {
    UIImage *colorImage = [self hy_gradientColorImageWith:direction colors:colors size:size];
    return [UIColor colorWithPatternImage:colorImage];
}

+ (UIColor *)hy_gradientColorWithStartPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint
                                  locations:(NSArray<NSNumber *> * _Nullable)locations
                                     colors:(NSArray <UIColor *>*)colors
                                       size:(CGSize)size {
    UIImage *colorImage = [self hy_gradientColorImageWithStartPoint:startPoint endPoint:endPoint locations:locations colors:colors size:size];
    return [UIColor colorWithPatternImage:colorImage];
}

#pragma mark -

+ (UIImage *)hy_gradientColorImageWith:(HYGradientColorDirection)direction
                                colors:(NSArray<UIColor *> *)colors
                                  size:(CGSize)size {
    CGPoint startPoint;
    CGPoint endPoint;
    switch (direction) {
        case HYGradientColorDirectionFromLeftToRight: {
            startPoint = CGPointMake(0, 0.5);
            endPoint = CGPointMake(1, 0.5);
        } break;
            
        case HYGradientColorDirectionFromTopLeftToBottomRight: {
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 1);
        } break;
            
        case HYGradientColorDirectionFromBottomLeftToTopRight: {
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(1, 0);
        } break;
            
        case HYGradientColorDirectionFromTopToBottom:
        default: {
            startPoint = CGPointMake(0.5, 0);
            endPoint = CGPointMake(0.5, 1);
        } break;
    }
    return [self hy_gradientColorImageWithStartPoint:startPoint endPoint:endPoint locations:nil colors:colors size:size];
}

+ (UIImage *)hy_gradientColorImageWithStartPoint:(CGPoint)startPoint
                                        endPoint:(CGPoint)endPoint
                                       locations:(NSArray<NSNumber *> * _Nullable)locations
                                          colors:(NSArray <UIColor *>*)colors
                                            size:(CGSize)size {
    if (colors == nil || colors.count == 0 || size.width <= 0 || size.height <= 0) return nil;
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgColors addObject:(id)[color CGColor]];
    }
    
    gradientLayer.colors = cgColors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.locations = locations;
    
    UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, NO, [UIScreen mainScreen].scale);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return colorImage;
}


@end
