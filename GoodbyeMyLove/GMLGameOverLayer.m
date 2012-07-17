//
//  GMLGameOverLayer.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLGameLayer.h"
#import "GMLGameOverLayer.h"
#import "GMLHelper.h"
#import "VUMacSupport.h"

@interface GMLGameOverLayer ()

@property (nonatomic, retain) CCLabelTTF* instructionsLabel;
@property (nonatomic, retain) CCLabelTTF* scoreLabel;
@property (nonatomic, assign) CGFloat timeElapsed;

@end

#pragma mark -

@implementation GMLGameOverLayer

@synthesize instructionsLabel;
@synthesize score;
@synthesize scoreLabel;
@synthesize timeElapsed;

#pragma mark -

+(UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size {
#if TARGET_OS_IPHONE
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
#else
    return nil;
#endif
}

#if TARGET_OS_IPHONE

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[CCDirector sharedDirector] replaceScene:[GMLGameLayer scene]];
}

#endif

#pragma mark -

-(void)gameLoop:(ccTime)time {
    self.scoreLabel.string = self.score;
    
    self.timeElapsed += time;
    if (self.timeElapsed < 0.3) return;
    self.timeElapsed = 0.0;
    
    if (self.instructionsLabel.string) {
        self.instructionsLabel.string = nil;
    } else {
        self.instructionsLabel.string = NSLocalizedString(@"GAME-OVER-INSTRUCTIONS", @"Instruction message");
    }
}

-(id)init {
    self = [super init];
    if (self) {
        self.fontName = @"JoystixMonospace-Regular";
        self.score = @"232342";
        
        [self removeAllChildrenWithCleanup:YES];
        
        CCLabelTTF* last = nil;
        CGSize size = self.contentSize;
        
#if TARGET_OS_IPHONE
        UIImage* coloredImage = [[self class] imageWithColor:GMLGameOverColor size:self.contentSize];
        CCSprite* bg = [CCSprite spriteWithCGImage:coloredImage.CGImage key:@"GameOverBackground"];
        bg.position = ccp(size.width / 2, size.height / 2);
        [self addChild:bg z:0];
#endif
        
        last = [self addText:NSLocalizedString(@"GAME-OVER", @"Game Over headline") color:ccWHITE fontSize:60 
                    position:ccp(size.width / 2, size.height - 100) dimensions:CGSizeMake(size.width, 150)];
        last = [self addText:NSLocalizedString(@"FAIL", @"Failure message") color:ccWHITE fontSize:14 
                    position:ccp(size.width / 2, last.position.y - last.contentSize.height) 
                  dimensions:CGSizeMake(size.width / 1.5, 100)];
        last = [self addText:NSLocalizedString(@"GAME-OVER-SCORE", @"Score message") color:ccWHITE fontSize:12 
                    position:ccp(size.width / 2, last.position.y - 50)];
        
        last = [self addText:self.score color:ccWHITE fontSize:30 position:ccp(size.width / 2, 
                                                                               last.position.y - last.contentSize.height - 10)];
        self.scoreLabel = last;
        
        last = [self addText:nil color:ccWHITE fontSize:13 position:ccp(size.width / 2, 50)];
        self.instructionsLabel = last;
    }
    return self;
}

@end
