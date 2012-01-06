//
//  GMLPlayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLPlayer.h"

@interface GMLPlayer ()

@property (nonatomic, assign) BOOL touching;

-(CGRect)rectInPixels;

@end

#pragma mark -

@implementation GMLPlayer

@synthesize level;
@synthesize score;
@synthesize touching;

-(CGRect)rectInPixels {
    CGSize size = [self contentSizeInPixels];
    return CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height);
}

#if TARGET_OS_IPHONE

#pragma mark -

-(BOOL)containsTouchLocation:(UITouch*)touch {
    CGPoint point = [self convertTouchToNodeSpaceAR:touch];
    CGRect rect = [self rectInPixels];
    return CGRectContainsPoint(rect, point);
}

#pragma mark -

-(void)onEnter {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

-(void)onExit {
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [super onExit];
}

-(BOOL)ccTouchBegan:(UITouch*)touch withEvent:(UIEvent*)event {
    if (![self containsTouchLocation:touch]) return NO;
    self.touching = YES;
    return YES;
}

-(void)ccTouchEnded:(UITouch*)touch withEvent:(UIEvent*)event {
    self.touching = NO;
}

// FIXME: Flicker, wrong position
-(void)ccTouchMoved:(UITouch*)touch withEvent:(UIEvent*)event {
    if (!self.touching) return;
    CGPoint touchPoint = [self convertTouchToNodeSpaceAR:touch];
    NSLog(@"Moved to: %@", NSStringFromCGPoint(touchPoint));
    self.position = touchPoint;
}

#endif

@end
