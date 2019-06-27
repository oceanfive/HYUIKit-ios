//
//  MYLayer.m
//  HYUIKit-ios_Example
//
//  Created by ocean on 2019/6/20.
//  Copyright © 2019 oceanfive. All rights reserved.
//

#import "MYLayer.h"

@implementation MYLayer

- (BOOL)needsDisplay {
    NSLog(@"%s - 1", __FUNCTION__);
    BOOL result = [super needsDisplay];
    NSLog(@"%s - 2 - %@", __FUNCTION__, @(result));
    return result;
}

- (void)display {
    NSLog(@"%s - 1", __FUNCTION__);
    [super display];
    NSLog(@"%s - 2", __FUNCTION__);
}

- (void)drawInContext:(CGContextRef)ctx {
    NSLog(@"%s - 1", __FUNCTION__);
    [super drawInContext:ctx];
    NSLog(@"%s - 2", __FUNCTION__);
}

- (void)setNeedsDisplay {
    NSLog(@"%s - 1", __FUNCTION__);
    [super setNeedsDisplay];
    NSLog(@"%s - 2", __FUNCTION__);
}

@end
