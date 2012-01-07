//
//  GMLPlayer.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"

#import "VUMacSupport.h"

@protocol GMLPlayerDelegate <NSObject>

-(void)playerMovedToPoint:(CGPoint)point;

@end

#pragma mark -

@interface GMLPlayer : CCSprite <CCTargetedTouchDelegate>

@property (nonatomic, assign) NSUInteger level;
@property (nonatomic, assign) NSUInteger score;

+(id)player;

@end
