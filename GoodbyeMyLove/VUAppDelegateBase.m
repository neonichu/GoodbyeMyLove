//
//  VUAppDelegateBase.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"
#import "SimpleAudioEngine.h"

#import "GMLMenuLayer.h"
#import "VUAppDelegateBase.h"

@implementation VUAppDelegateBase

-(void)applicationDidFinishLaunching
{	
	CCDirector *director = [CCDirector sharedDirector];
	
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:YES];
	
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
	[[CCDirector sharedDirector] runWithScene: [GMLMenuLayer scene]];
    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"443238_Sorry.MP3"];
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
