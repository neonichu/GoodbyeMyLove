//
//  GMLLovedOne.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLLovedOne.h"

static const NSUInteger kDefaultPoints = 50;

@implementation GMLLovedOne

// TODO: random generated dudes

@synthesize fromAddressBook;
@dynamic isLovedOne;
@synthesize name;
@synthesize points;

#pragma mark -

+(id)lovedOne {
    id result = [self spriteWithFile:@"dude2.png"];
    [(GMLLovedOne*)result setAlive:YES];
    [(GMLLovedOne*)result setPoints:kDefaultPoints];
    return result;
}

+(id)lovedOneWithName:(NSString*)name fromAddressBook:(BOOL)fromAddressBook {
    id result = [self lovedOne];
    [(GMLLovedOne*)result setFromAddressBook:fromAddressBook];
    [(GMLLovedOne*)result setName:name];
    return result;
}

#pragma mark -

-(void)gameLoop:(ccTime)time {
    if (!self.alive) {
        return;
    }
    
    CGPoint position = self.position;
    
    switch (arc4random() % 10) {
        case 0:
            position.x += 5.0;
            break;
        case 1:
            position.x -= 5.0;
            break;
        case 2:
            position.y += 5.0;
            break;
        case 3:
            position.y -= 5.0;
            break;
    }
    
    if (CGPointEqualToPoint(self.position, position) || self.numberOfRunningActions > 0) {
        return;
    }
    
    id action = [CCMoveTo actionWithDuration:0.1f position:position];
    [self runAction:action];
}

-(BOOL)isLovedOne {
    return self.points > 0;
}

-(void)removeFromParentAndCleanup:(BOOL)cleanup {
    [super removeFromParentAndCleanup:cleanup];
    self.alive = NO;
}

@end
