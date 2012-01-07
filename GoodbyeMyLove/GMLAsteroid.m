//
//  GMLAsteroid.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLAsteroid.h"

@implementation GMLAsteroid

@synthesize delegate;
@synthesize movementSpeed;
@synthesize rotationSpeed;

#pragma mark -

+(id)asteroid {
    id result = [self spriteWithFile:@"asteroid.png"];
    [result setMovementSpeed:2.0];
    [result setRotationSpeed:2.0];
    return result;
}

-(void)gameLoop:(ccTime)time {
    self.rotation += self.rotationSpeed;
    self.position = ccp(self.position.x, self.position.y - self.movementSpeed);
    
    if (self.position.y >= 0.0) {
        [self.delegate gameOverHappened];
    }
}

@end
