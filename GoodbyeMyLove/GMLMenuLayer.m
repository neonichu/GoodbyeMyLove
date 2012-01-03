//
//  GMLMenuLayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLGameLayer.h"
#import "GMLMenuLayer.h"

@implementation GMLMenuLayer

+(CCScene*)scene
{
	CCScene *scene = [CCScene node];
	GMLMenuLayer *layer = [GMLMenuLayer node];
	[scene addChild:layer];
	return scene;
}

-(CCLabelTTF*)addText:(NSString*)text color:(ccColor3B)color fontSize:(int)fontSize position:(CGPoint)position {
    CCLabelTTF* label = [CCLabelTTF labelWithString:text fontName:@"Marker Felt" fontSize:fontSize];
    label.color = color;
    label.position = position;
    [self addChild:label];
    return label;
}

-(CCLabelTTF*)addText:(NSString*)text color:(ccColor3B)color fontSize:(int)fontSize position:(CGPoint)position 
           dimensions:(CGSize)dimensions {
    CCLabelTTF* label = [CCLabelTTF labelWithString:text dimensions:dimensions alignment:UITextAlignmentCenter fontName:@"Marker Felt" 
                                           fontSize:fontSize];
    label.color = color;
    label.position = position;
    [self addChild:label];
    return label;
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // TODO: Animate transition
    [[CCDirector sharedDirector] replaceScene:[GMLGameLayer scene]];
}

-(id)init
{
    self = [super init];
    if (self) {
        self.isTouchEnabled = YES;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite* bg = [CCSprite spriteWithFile:@"backdrop.png"];
        [bg setPosition:ccp(size.width / 2, size.height / 2)];
        [self addChild:bg z:0];
        
        // TODO: Asteroid rotates
        
        CCSprite* asteroid = [CCSprite spriteWithFile:@"asteroid.png"];
        [asteroid setPosition:ccp(size.width / 2, size.height + asteroid.contentSize.height / 6)];
        [self addChild:asteroid z:0];
        
        ccColor3B color1 = ccBLACK;
        ccColor3B color2 = ccBLUE;
        
        CCLabelTTF* last = [self addText:NSLocalizedString(@"TITLE", @"Game title") color:color1 fontSize:24 
                                position:ccp(size.width / 2, size.height - 20)];
        last = [self addText:NSLocalizedString(@"TAGLINE", @"Game tagline") color:color1 fontSize:12 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height * 2.4) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, asteroid.contentSize.height / 3)];
        
        // TODO: Display high-score
        
        // TODO: Touch anywhere should be blinking
        
        last = [self addText:NSLocalizedString(@"INSTRUCTIONS", @"Gameplay instructions") color:color1 fontSize:18 
                    position:ccp(size.width / 2, size.height / 2) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, asteroid.contentSize.height / 3)];
        last = [self addText:NSLocalizedString(@"TWEET", @"Text of original tweet") color:color2 fontSize:14 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height - 10) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, asteroid.contentSize.height / 4)];
        last = [self addText:NSLocalizedString(@"COPYRIGHT", @"Copyright information") color:color1 fontSize:15 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, asteroid.contentSize.height / 6)];
        
        // TODO: Domain names should be clickable links
    }
    return self;
}

@end
