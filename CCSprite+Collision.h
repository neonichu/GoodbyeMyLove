//
//  CCSprite+Collision.h
//  GoodbyeMyLove
//
//  Created by Boris Buegling on 22.07.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "CCSprite.h"

@interface CCSprite (Collision)

-(BOOL)collidesWith:(CCSprite*)otherSprite;

@end
