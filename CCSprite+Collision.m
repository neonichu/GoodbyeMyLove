//
//  CCSprite+Collision.m
//  GoodbyeMyLove
//
//  Created by Boris Buegling on 22.07.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "CCSprite+Collision.h"

@implementation CCSprite (Collision)

-(CGRect)collisionRect {
    return CGRectMake(self.position.x - (self.contentSize.width * self.scaleX) / 2.0,
                      self.position.y - (self.contentSize.height * self.scaleX) / 2.0,
                      self.contentSize.width * self.scaleX,
                      self.contentSize.height * self.scaleX);
}

-(BOOL)collidesWith:(CCSprite*)otherSprite {
    return CGRectIntersectsRect(self.collisionRect, otherSprite.collisionRect);
}

@end
