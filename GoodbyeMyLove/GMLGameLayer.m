//
//  GMLGameLayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLAsteroid.h"
#import "GMLGameLayer.h"
#import "GMLGameOverLayer.h"
#import "GMLLovedOne.h"
#import "GMLPeople.h"
#import "GMLPlayer.h"

@interface GMLGameLayer ()

@property (nonatomic, retain) GMLAsteroid* asteroid;
@property (nonatomic, retain) GMLPlayer* player;
@property (nonatomic, retain) NSMutableArray* npcs;
@property (nonatomic, assign) CGFloat timeElapsed;

@end

#pragma mark -

@implementation GMLGameLayer

@synthesize asteroid;
@synthesize npcs;
@synthesize player;
@synthesize timeElapsed;

#pragma mark -

-(void)gameLoop:(ccTime)time {
    self.timeElapsed += time;
    
    [self.asteroid gameLoop:time];
    
    // TODO: When level is done increase number of NPCs, asteroid speed, etc.
    // TODO: Move loved ones
    // TODO: Collision detection with loved ones
    // TODO: Init bubbles for the first n seconds
    
    if (timeElapsed > 2.0) {
        [self gameOverHappened];
    }
}

-(void)gameOverHappened {
    CCScene* gameOverScene = [GMLGameOverLayer scene];
    ((GMLGameOverLayer*)[gameOverScene.children objectAtIndex:0]).score = [NSString stringWithFormat:@"%ld", (long)self.player.score];
    [[CCDirector sharedDirector] replaceScene:gameOverScene];
}

-(void)initLevel {
    NSUInteger npcCount = self.npcs.count;
    if (npcCount == 0) {
        npcCount = 3;
    } else {
        npcCount += 2;
    }
    
    for (CCSprite* npc in self.npcs) {
        [npc removeFromParentAndCleanup:YES];
    }
    [self.npcs removeAllObjects];
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    [self.asteroid setPosition:ccp(size.width / 2, size.height + asteroid.contentSize.height / 6)];
    [self.player setPosition:ccp(size.width / 2, size.height / 2)];
    
    // TODO: Mark actual loved ones with score
    for (GMLLovedOne* lovedOne in [GMLPeople lovedOnesWithLimit:npcCount]) {
        [lovedOne setPosition:ccp(arc4random() % (int)size.width, arc4random() % (int)(size.height - size.height / 3))];
        [self addChild:lovedOne];
        [self.npcs addObject:lovedOne];
    }
}

-(id)init {
    self = [super init];
    if (self) {
        self.fontName = @"JoystixMonospace-Regular";
        self.npcs = [NSMutableArray array];
        
        self.asteroid = [GMLAsteroid asteroid];
        [self addChild:self.asteroid z:INT16_MAX];
        
        self.player = [GMLPlayer player];
        [self addChild:self.player];
        
        [self initLevel];
    }
    return self;
}

@end
