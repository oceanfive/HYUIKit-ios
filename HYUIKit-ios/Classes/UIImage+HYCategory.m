//
//  UIImage+HYCategory.m
//  HYKit
//
//  Created by wuhaiyang on 2016/11/25.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import "UIImage+HYCategory.h"
#import <math.h>

static inline double radians (double degrees) {
    return degrees * M_PI / 180;
}

@implementation UIImage (HYCategory)


+ (UIImage *)hy_createImageWithColor:(UIColor *)color size:(CGSize)size {
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

#pragma mark - 旋转和缩放
- (UIImage *)hy_getNewImageWithScale:(CGPoint)scale angle:(CGFloat)angle {
    CGFloat radian = radians(angle);
    CGSize size = CGSizeMake(self.size.width * scale.x, self.size.height * scale.y);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 平移到中心位置
    CGContextTranslateCTM(context, size.width / 2, size.height / 2);
    // 旋转
    CGContextRotateCTM(context, radian);
    //坐标转换，上下翻转
    CGContextScaleCTM(context, 1.0, -1.0);
    // 图片需要最后进行绘制
    CGContextDrawImage(context, CGRectMake(- size.width / 2, - size.height / 2, size.width, size.height), self.CGImage);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)hy_getNewImageWithScale:(CGFloat)scale orientation:(UIImageOrientation)orientation {
    UIImage *newImage = [UIImage imageWithCGImage:self.CGImage scale:scale orientation:orientation];
    return newImage;
}

- (UIImage *)hy_getNewImageWithScale:(CGFloat)scale {
    return [self hy_getNewImageWithScale:scale orientation:self.imageOrientation];
}

- (UIImage *)hy_getNewImageWithOrientation:(UIImageOrientation)orientation {
    return [self hy_getNewImageWithScale:self.scale orientation:orientation];
}

#pragma mark - 图片镜像
- (UIImage *)hy_leftRightMirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationUpMirrored];
}

- (UIImage *)hy_topBottomMirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationDownMirrored];
}

- (UIImage *)hy_leftDiagonal45MirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationLeftMirrored];
}

- (UIImage *)hy_rightDiagonal45MirroredImage {
    return [self hy_getNewImageWithOrientation:UIImageOrientationRightMirrored];
}

#pragma mark - 缩放图片
- (UIImage *)hy_getScaledImageWithScaleToSize:(CGSize)size {
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
#pragma mark - 这里两种方法“drawInRect”和“drawAtPoint”使用，产生的结果不一样,目前暂时使用drawInRect方法
}

#pragma mark - 图片裁剪
- (UIImage *)hy_getDefaultCircleImage {
    return [self hy_getDefaultCircleImageWithBorderWidth:0 borderColor:nil];
}

- (UIImage *)hy_getDefaultCircleImageWithBorderWidth:(CGFloat)borderWidth
                                         borderColor:(UIColor *)borderColor {
    
    CGPoint center = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
    return [self hy_getCircleImageWithCenter:center
                                      radius:MIN(self.size.width, self.size.height)/2
                                 borderWidth:borderWidth
                                 borderColor:borderColor];
}

- (UIImage *)hy_getDefaultCircleImageWithRadius:(CGFloat)radius {
    CGPoint center = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
    return [self hy_getCircleImageWithCenter:center radius:radius];
}

- (UIImage *)hy_getCircleImageWithCenter:(CGPoint)center
                                  radius:(CGFloat)radius {
    
    return [self hy_getCircleImageWithCenter:center
                                      radius:radius
                                 borderWidth:0.0
                                 borderColor:nil];
}

- (UIImage *)hy_getCircleImageWithCenter:(CGPoint)center
                                  radius:(CGFloat)radius
                             borderWidth:(CGFloat)borderWidth
                             borderColor:(UIColor *)borderColor {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    return [self hy_getClippedImageWithPath:path
                                borderWidth:borderWidth
                                borderColor:borderColor];
}

- (UIImage *)hy_getDefaultRoundedRectImageWithRoundingCorners:(UIRectCorner)corners
                                                  cornerRadii:(CGSize)cornerRadii {
    return [self hy_getDefaultRoundedRectImageWithRoundingCorners:corners cornerRadii:cornerRadii borderWidth:0 borderColor:nil];
}

- (UIImage *)hy_getRoundedRectImageWithRoundedRect:(CGRect)rect
                                   roundingCorners:(UIRectCorner)corners
                                       cornerRadii:(CGSize)cornerRadii {
    
    return [self hy_getRoundedRectImageWithRoundedRect:rect roundingCorners:corners cornerRadii:cornerRadii borderWidth:0 borderColor:nil];
}

- (UIImage *)hy_getDefaultRoundedRectImageWithRoundingCorners:(UIRectCorner)corners
                                                  cornerRadii:(CGSize)cornerRadii
                                                  borderWidth:(CGFloat)borderWidth
                                                  borderColor:(UIColor *)borderColor {
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    return [self hy_getRoundedRectImageWithRoundedRect:rect
                                       roundingCorners:corners
                                           cornerRadii:cornerRadii
                                           borderWidth:borderWidth
                                           borderColor:borderColor];
}


- (UIImage *)hy_getRoundedRectImageWithRoundedRect:(CGRect)rect
                                   roundingCorners:(UIRectCorner)corners
                                       cornerRadii:(CGSize)cornerRadii
                                       borderWidth:(CGFloat)borderWidth
                                       borderColor:(UIColor *)borderColor {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    return [self hy_getClippedImageWithPath:path borderWidth:borderWidth borderColor:borderColor];
}


- (UIImage *)hy_getClippedImageWithPath:(UIBezierPath *)path
                            borderWidth:(CGFloat)borderWidth
                            borderColor:(UIColor *)borderColor {
    // 裁剪路径 - 绘制图片 - 绘制边框
    
    CGSize size = self.size;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (path) [path addClip]; // 裁剪
    [self drawInRect:rect]; // 绘制图片
    
    // 绘制边框; path 存在表示在 path 路径上绘制边框; path 不存在，默认矩形边框;
    if (!path) {
        path = [UIBezierPath bezierPathWithRect:rect];
    }
    path.lineWidth = borderWidth;
    if (borderColor) [borderColor setStroke];
    [path stroke];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
    /**
     这里不使用下面的方法，这会导致图片大小变化了，会影响性能
     CGSize size = CGSizeMake(self.size.width + borderWidth * 2, self.size.height + borderWidth * 2);
     */
}


#pragma mark - 给图片添加水印
- (UIImage *)hy_getTextStampImageAtRect:(CGRect)rect text:(NSString *)text dict:(NSDictionary *)dict{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawAtPoint:CGPointZero];
    [text drawInRect:rect withAttributes:dict];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)hy_getImageStampImageAtRect:(CGRect)rect image:(UIImage *)image{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawAtPoint:CGPointZero];
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


#pragma mark - 图片渲染
- (UIImage *)hy_getOriginalImage{
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
