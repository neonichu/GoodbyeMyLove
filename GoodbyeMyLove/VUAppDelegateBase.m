//
//  VUAppDelegateBase.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <notify.h>

#import "cocos2d.h"
#import "SimpleAudioEngine.h"

#import "GMLMenuLayer.h"
#import "GMLPersistentStorage.h"
#import "VUAppDelegateBase.h"

@implementation VUAppDelegateBase

@synthesize storage;

#pragma mark -

-(CCScene*)applicationDidFinishLaunching
{	
    NSLog(@"Running app %@", [NSBundle mainBundle].bundleIdentifier);
    
	CCDirector *director = [CCDirector sharedDirector];
	
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:YES];
	
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
    CCScene* scene = [GMLMenuLayer scene];
	[[CCDirector sharedDirector] runWithScene:scene];
    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"443238_Sorry.MP3"];
    
    self.storage = [[GMLPersistentStorage alloc] init];
    [self.storage authenticateLocalUser];
    
    return scene;
}

-(void)applicationWillResignActive
{
	[[CCDirector sharedDirector] pause];
}

-(void)applicationDidBecomeActive 
{
	[[CCDirector sharedDirector] resume];
}

-(void)applicationDidReceiveMemoryWarning 
{
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void)applicationDidEnterBackground
{
	[[CCDirector sharedDirector] stopAnimation];
}

-(void)applicationWillEnterForeground
{
	[[CCDirector sharedDirector] startAnimation];
}

-(void)applicationWillTerminate 
{
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
	[director end];	
}

-(void)applicationSignificantTimeChange
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

-(void)dealloc {
	[[CCDirector sharedDirector] end];
}

@end
