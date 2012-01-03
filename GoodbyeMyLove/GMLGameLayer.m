//
//  GMLGameLayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLGameLayer.h"
#import "GMLPlayer.h"

@interface GMLGameLayer ()

@property (nonatomic, retain) CCSprite* asteroid;
@property (nonatomic, retain) GMLPlayer* player;

@end

#pragma mark -

@implementation GMLGameLayer

@synthesize asteroid;
@synthesize player;

#pragma mark -

+(CCScene*)scene {
    CCScene *scene = [CCScene node];
	GMLGameLayer *layer = [GMLGameLayer node];
	[scene addChild:layer];
	return scene;
}

-(void)gameLoop:(ccTime)time {
    self.asteroid.rotation += 5.0;
    self.asteroid.position = ccp(self.asteroid.position.x, self.asteroid.position.y - 5.0);
    
    if (self.asteroid.position.y == 0.0) {
        // TODO: Game Over
    }
    
    
}

-(id)init {
    self = [super init];
    if (self) {
        self.isTouchEnabled = YES;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* bg = [CCSprite spriteWithFile:@"backdrop.png"];
        [bg setPosition:ccp(size.width / 2, size.height / 2)];
        [self addChild:bg z:0];
        
        self.asteroid = [CCSprite spriteWithFile:@"asteroid.png"];
        [self.asteroid setPosition:ccp(size.width / 2, size.height + asteroid.contentSize.height / 6)];
        [self addChild:self.asteroid];
        
        self.player = [GMLPlayer spriteWithFile:@"dude1.png"];
        [self.player setPosition:ccp(size.width / 2, size.height / 2)];
        [self addChild:self.player];
        
        [self schedule:@selector(gameLoop:) interval:1.0/60.0];
    }
    return self;
}

@end
