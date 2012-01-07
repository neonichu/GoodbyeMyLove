//
//  GMLMenuLayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLAsteroid.h"
#import "GMLGameLayer.h"
#import "GMLHelper.h"
#import "GMLMenuLayer.h"
#import "VUMacSupport.h"

@interface GMLMenuLayer ()

@property (nonatomic, retain) GMLAsteroid* asteroid;
@property (nonatomic, retain) CCLabelTTF* gameCenter;
@property (nonatomic, retain) CCLabelTTF* instructions;
@property (nonatomic, assign) CGFloat timeElapsed;

@end

#pragma mark -

@implementation GMLMenuLayer

@synthesize asteroid;
@synthesize gameCenter;
@synthesize instructions;
#if TARGET_OS_IPHONE
@synthesize rootVC;
#endif
@synthesize timeElapsed;

#pragma mark -

#if TARGET_OS_IPHONE

- (void)achievementViewControllerDidFinish:(GKAchievementViewController*)viewController {
    [self.rootVC dismissModalViewControllerAnimated:YES];
}

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touchPoint = [self convertTouchToNodeSpaceAR:[touches anyObject]];
    touchPoint = [self convertToWorldSpaceAR:touchPoint];
    
    if (CGRectContainsPoint(self.gameCenter.boundingBox, touchPoint)) {
        GKAchievementViewController *achievementsVC = [[GKAchievementViewController alloc] init];
        if (achievementsVC) {
            achievementsVC.achievementDelegate = self;
            [self.rootVC presentModalViewController:achievementsVC animated:YES];
        }
        return;
    }
    
    [[CCDirector sharedDirector] replaceScene:[GMLGameLayer scene]];
}

#endif

#pragma mark -

-(void)gameLoop:(ccTime)time {
    [self.asteroid gameLoop:time];
    
    self.timeElapsed += time;
    if (self.timeElapsed < 0.3) return;
    self.timeElapsed = 0.0;
    
    if (self.instructions.string) {
        self.instructions.string = nil;
    } else {
        self.instructions.string = NSLocalizedString(@"ADVANCE", @"Advance instructions");
    }
}

-(id)init
{
    self = [super init];
    if (self) {
        self.fontName = @"Gubblebum-BlacknBlocky";
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        self.asteroid = [GMLAsteroid asteroid];
        self.asteroid.movementSpeed = 0.0;
        [self.asteroid setPosition:ccp(size.width / 2, size.height + self.asteroid.contentSize.height / 6)];
        [self addChild:self.asteroid z:0];
        
        ccColor3B color1 = GMLTitleTextColor;
        ccColor3B color2 = ccWHITE;
        CCLabelTTF* last = nil;
        
        last = [self addText:NSLocalizedString(@"TITLE", @"Game title") color:color1 fontSize:24 
                    position:ccp(size.width / 2, size.height - 20)];
        last = [self addText:NSLocalizedString(@"TAGLINE", @"Game tagline") color:color1 fontSize:10 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height * 3.5) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, asteroid.contentSize.height / 3)];
        
        self.gameCenter = [self addText:@"GameCenter" color:color1 fontSize:24 position:ccp(size.width / 2, last.position.y + 15)];
       
        last = [self addText:nil color:color1 
                    fontSize:18 position:ccp(size.width / 2, size.height / 2 + 40)];
        self.instructions = last;
        
        last = [self addText:NSLocalizedString(@"INSTRUCTIONS", @"Gameplay instructions") color:color1 fontSize:18 
                    position:ccp(size.width / 2, size.height / 2) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, size.height / 4)];
        last = [self addText:NSLocalizedString(@"TWEET", @"Text of original tweet") color:color2 fontSize:14 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height + 10) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, size.height / 5.9)];
        last = [self addText:NSLocalizedString(@"COPYRIGHT", @"Copyright information") color:color1 fontSize:15 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height - 20) 
                  dimensions:CGSizeMake(asteroid.contentSize.width, size.height / 5)];
    }
    return self;
}

@end
