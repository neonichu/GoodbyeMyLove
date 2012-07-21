//
//  UIScreen+VUAdditions.m
//  GoodbyeMyLove
//
//  Created by Boris Buegling on 22.07.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "UIScreen+VUAdditions.h"

@implementation UIScreen (VUAdditions)

+(CGSize)absoluteSizeForSize:(CGSize)size {
    CGFloat scale = [[self mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}

@end
