//
//  MYView.m
//  HYUIKit-ios_Example
//
//  Created by ocean on 2019/6/20.
//  Copyright © 2019 oceanfive. All rights reserved.
//

#import "MYView.h"
#import "MYLayer.h"

@implementation MYView

+ (Class)layerClass {
    NSLog(@"%s", __FUNCTION__);
    return [MYLayer class];
}

- (void)displayLayer:(CALayer *)layer {
    NSLog(@"%s - 1", __FUNCTION__);
    [super displayLayer:layer];
    NSLog(@"%s - 2", __FUNCTION__);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"%s - 1", __FUNCTION__);
    [super drawLayer:layer inContext:ctx];
    NSLog(@"%s - 2", __FUNCTION__);
}

//- (void)setNeedsDisplay {
//    NSLog(@"%s - 1", __FUNCTION__);
//    [super setNeedsDisplay];
//    NSLog(@"%s - 2", __FUNCTION__);
//}

@end
