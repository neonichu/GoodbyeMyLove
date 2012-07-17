//
//  GMLBaseLayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"

#import "GMLBaseLayer.h"
#import "VUMacSupport.h"

@implementation GMLBaseLayer

@synthesize fontName;

#pragma mark -

+(CCScene*)scene {
    CCScene *scene = [CCScene node];
	id layer = [self node];
	[scene addChild:layer];
	return scene;
}

#pragma mark -

-(CCLabelTTF*)addText:(NSString*)text color:(ccColor3B)color fontSize:(int)fontSize position:(CGPoint)position {
    CCLabelTTF* label = [CCLabelTTF labelWithString:text fontName:self.fontName fontSize:fontSize];
    label.color = color;
    label.position = position;
    [self addChild:label];
    return label;
}

-(CCLabelTTF*)addText:(NSString*)text color:(ccColor3B)color fontSize:(int)fontSize position:(CGPoint)position 
           dimensions:(CGSize)dimensions {
    CCLabelTTF* label = [CCLabelTTF labelWithString:text dimensions:dimensions alignment:UITextAlignmentCenter 
                                           fontName:self.fontName fontSize:fontSize];
    label.color = color;
    label.position = position;
    [self addChild:label];
    return label;
}

#pragma mark -

-(void)gameLoop:(ccTime)time {
}

-(id)init {
    self = [super init];
    if (self) {
        self.fontName = @"Marker Felt";
        self.isTouchEnabled = YES;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite* bg = [CCSprite spriteWithFile:@"backdrop.png"];
        [bg setPosition:ccp(size.width / 2, size.height / 2)];
        [self addChild:bg z:0];
        
        [self schedule:@selector(gameLoop:) interval:1.0/60.0];
    }
    return self;
}

@end
