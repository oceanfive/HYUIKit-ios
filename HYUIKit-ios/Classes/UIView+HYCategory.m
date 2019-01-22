//
//  UIView+HYCategory.m
//  HYUIKit-ios_Example
//
//  Created by ocean on 2019/1/22.
//  Copyright © 2019 oceanfive. All rights reserved.
//

#import "UIView+HYCategory.h"
#import "HYGeometry.h"

@implementation UIView (HYCategory)

- (void)hy_alignRect {
    self.frame = CGRectCeil(self.frame);
}

@end
