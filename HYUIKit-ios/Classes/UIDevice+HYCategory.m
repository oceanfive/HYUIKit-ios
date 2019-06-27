//
//  UIDevice+HYCategory.m
//  StudyJailBreak2
//
//  Created by ocean on 2019/4/28.
//  Copyright © 2019 ocean. All rights reserved.
//

#import "UIDevice+HYCategory.h"

@implementation UIDevice (HYCategory)

+ (BOOL)hy_isJailBreak {
    NSArray *paths = @[@"/Applications/Cydia.app",
                       @"/private/var/lib/cydia"
                       ];
    for (NSString *path in paths) {
        BOOL result = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if (result) return YES;
    }
    return NO;
}

@end
