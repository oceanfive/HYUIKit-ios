//
//  HYGeometry.h
//  HYUIKit-ios
//
//  Created by ocean on 2019/1/22.
//  Copyright © 2019 oceanfive. All rights reserved.
//

#ifndef HYGeometry_h
#define HYGeometry_h

#import <CoreGraphics/CoreGraphics.h>


/**
 rect的x、y、width、height 都执行一次ceilf()函数，向正无穷取整

 @param rect rect
 @return rect
 
 例子:
 
 CGRect rect = CGRectMake(0.1, 0.5, 100.123, 100.951);
 NSLog(@"%@", NSStringFromCGRect(rect));
 rect = CGRectCeil(rect);
 NSLog(@"%@", NSStringFromCGRect(rect));
 输出:
 {{0.10000000000000001, 0.5}, {100.123, 100.95099999999999}}
 {{1, 1}, {101, 101}}
 */
CG_INLINE CGRect
CGRectCeil(CGRect rect)
{
    rect.origin.x = ceilf(rect.origin.x);
    rect.origin.y = ceilf(rect.origin.y);
    rect.size.width = ceilf(rect.size.width);
    rect.size.height = ceilf(rect.size.height);
    return rect;
}

#endif /* HYGeometry_h */
