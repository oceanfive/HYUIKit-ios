//
//  UIColor+HYCategory.h
//  Category
//
//  Created by wuhaiyang on 16/8/25.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 颜色渐变方向
typedef NS_ENUM(NSUInteger, HYGradientColorDirection) {
    /** 从左到右 */
    HYGradientColorDirectionFromLeftToRight,
    /** 从上到下 */
    HYGradientColorDirectionFromTopToBottom,
    /** 从左上到右下 */
    HYGradientColorDirectionFromTopLeftToBottomRight,
    /** 从左下到右上 */
    HYGradientColorDirectionFromBottomLeftToTopRight,  
};

@interface UIColor (HYCategory)

#pragma mark - 三基色
@property (nonatomic, readonly) CGFloat hy_red;   //三基色--红色
@property (nonatomic, readonly) CGFloat hy_green; //三基色--绿色
@property (nonatomic, readonly) CGFloat hy_blue;  //三基色--蓝色
@property (nonatomic, readonly) CGFloat hy_alpha; //透明度

/**
 根据颜色生成一张给定尺寸的图片
 
 @param color 颜色
 @param size  范围
 
 @return 图片UIImage
 */
+ (UIImage *)hy_createImageWithColor:(UIColor *)color
                                size:(CGSize)size;

#pragma mark - 十六进制获取颜色
/**
 根据十六进制颜色获取颜色，透明度为1.0
 
 @param hexValue   十六进制颜色 ， 传递格式为：0xffa0ca
 
 @return 颜色
 */
+ (UIColor *)hy_colorWithHex:(NSInteger)hexValue;

/**
 根据十六进制颜色获取颜色
 
 @param hexValue   十六进制颜色 ， 传递格式为：0xffa0ca
 @param alphaValue 透明度
 
 @return 颜色
 */
+ (UIColor *)hy_colorWithHex:(NSInteger)hexValue
                       alpha:(CGFloat)alphaValue;

#pragma mark - 随机色
/**
 随机色
 */
+ (UIColor *)hy_randomColor;

#pragma mark - 渐变颜色 =========================

/**
 获取有“渐变效果”的”颜色“，默认的颜色分割位置

 @param direction 渐变方向
 @param colors 需要渐变的颜色数组
 @param size 颜色显示的范围大小
 @return UIColor
 */
+ (UIColor *)hy_gradientColorWith:(HYGradientColorDirection)direction
                           colors:(NSArray<UIColor *> *)colors
                             size:(CGSize)size;

/**
 获取有“渐变效果”的”图片“，默认的颜色分割位置

 @param direction 渐变方向
 @param colors 需要渐变的颜色数组
 @param size 颜色显示的范围大小
 @return UIImage
 */
+ (UIImage *)hy_gradientColorImageWith:(HYGradientColorDirection)direction
                                colors:(NSArray<UIColor *> *)colors
                                  size:(CGSize)size;

/**
 获取有“渐变效果”的“颜色”，自定义颜色分割位置

 @param startPoint 开始点，范围为[0,0]-[1,1]，见下面1👇
 @param endPoint 结束点，范围为[0,0]-[1,1]，见下面1👇
 @param locations 渐变色的分割位置，范围为[0,1]，可以为空，见下面2👇；locations可以理解为对应的颜色的结束位置或者所占比例
 @param colors 需要渐变的颜色数组，见下面2👇
 @param size 渐变颜色显示的范围大小
 @return UIColor
 
 ps:
 1、[0,0] is the bottom-left corner of the layer, [1,1] is the top-right corner.
 
 [0,0]------[1,0]
   |          |
   |          |
   |          |
 [0,1]------[1,1]
 
 2、locations数组个数需要和colors数组个数保持一致；否则可能会导致没有渐变颜色效果
 
 3、使用例子：
 
 NSMutableArray *colors = [NSMutableArray array];
 [colors addObject:[UIColor redColor]];
 [colors addObject:[UIColor blueColor]];
 [colors addObject:[UIColor orangeColor]];
 
 self.view.backgroundColor = [UIColor hy_gradientColorWithStartPoint:CGPointMake(0, 0.25) endPoint:CGPointMake(1, 1) locations:@[@0.1, @0.8, @0.9] colors:colors size:self.view.size];
 
 */
+ (UIColor *)hy_gradientColorWithStartPoint:(CGPoint)startPoint
                                   endPoint:(CGPoint)endPoint
                                  locations:(NSArray<NSNumber *> * _Nullable)locations
                                     colors:(NSArray <UIColor *>*)colors
                                       size:(CGSize)size;


/**
 获取有“渐变效果”的“图片”，自定义颜色分割位置

 @param startPoint 开始点，范围为[0,0]-[1,1]
 @param endPoint 结束点，范围为[0,0]-[1,1]
 @param locations 渐变色的分割位置，范围为[0,1]，可以为空
 @param colors 需要渐变的颜色数组
 @param size 渐变颜色显示的范围大小
 @return UIImage
 */
+ (UIImage *)hy_gradientColorImageWithStartPoint:(CGPoint)startPoint
                                        endPoint:(CGPoint)endPoint
                                       locations:(NSArray<NSNumber *> * _Nullable)locations
                                          colors:(NSArray <UIColor *>*)colors
                                            size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
