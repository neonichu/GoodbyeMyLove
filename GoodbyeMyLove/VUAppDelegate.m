//
//  VUAppDelegate.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"

#import "GMLMenuLayer.h"
#import "RootViewController.h"
#import "VUAppDelegate.h"

@implementation VUAppDelegate

@synthesize window;

-(void)applicationDidFinishLaunching:(UIApplication*)application
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeDefault];
	
	
	CCDirector *director = [CCDirector sharedDirector];
	
	self.window.rootViewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
	self.window.rootViewController.wantsFullScreenLayout = YES;
	
	EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
								   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
								   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
						];
	
	[director setOpenGLView:glView];
	
    if (![director enableRetinaDisplay:YES]) {
        CCLOG(@"Retina Display Not supported");
    }
	
	[director setDeviceOrientation:kCCDeviceOrientationPortrait];
	[director setAnimationInterval:1.0/60];
	[director setDisplayFPS:YES];
	
	[self.window.rootViewController setView:glView];
	[self.window makeKeyAndVisible];
	
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
	[[CCDirector sharedDirector] runWithScene: [GMLMenuLayer scene]];
}

-(void)applicationWillResignActive:(UIApplication*)application 
{
	[[CCDirector sharedDirector] pause];
}

-(void)applicationDidBecomeActive:(UIApplication*)application {
	[[CCDirector sharedDirector] resume];
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication*)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void)applicationDidEnterBackground:(UIApplication*)application {
	[[CCDirector sharedDirector] stopAnimation];
}

-(void)applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

-(void)applicationWillTerminate:(UIApplication *)application {
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
    self.window = nil;
	
	[director end];	
}

-(void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

-(void)dealloc {
	[[CCDirector sharedDirector] end];
}

@end
