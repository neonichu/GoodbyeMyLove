//
//  GMLAsteroid.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"

#import "GMLHelper.h"

@interface GMLAsteroid : CCSprite

@property (nonatomic, assign) CGFloat movementSpeed;
@property (nonatomic, assign) CGFloat rotationSpeed;
@property (nonatomic, assign) id<GMLGameOverDelegate> delegate;

#pragma mark -

+(id)asteroid;

#pragma mark -

-(void)gameLoop:(ccTime)time;

@end
