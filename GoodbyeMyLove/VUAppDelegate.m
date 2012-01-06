//
//  VUAppDelegate.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"
#import "SimpleAudioEngine.h"

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
	
	[self.window.rootViewController setView:glView];
	[self.window makeKeyAndVisible];
    
    [self applicationDidFinishLaunching];
}

-(void)applicationWillResignActive:(UIApplication*)application 
{
	[self applicationWillResignActive];
}

-(void)applicationDidBecomeActive:(UIApplication*)application {
	[self applicationDidBecomeActive];
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication*)application {
	[self applicationDidReceiveMemoryWarning];
}

-(void)applicationDidEnterBackground:(UIApplication*)application {
	[self applicationDidEnterBackground];
}

-(void)applicationWillEnterForeground:(UIApplication*)application {
	[self applicationWillEnterForeground];
}

-(void)applicationWillTerminate:(UIApplication *)application {
	[self applicationWillTerminate];
	
    self.window = nil;
}

-(void)applicationSignificantTimeChange:(UIApplication *)application {
	[self applicationSignificantTimeChange];
}

@end
