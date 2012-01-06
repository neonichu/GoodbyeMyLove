//
//  VUAppDelegate.m
//  GoodbyeMyLove Mac
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"

#import "VUAppDelegate.h"

@implementation VUAppDelegate

@synthesize glView;
@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	CC_DIRECTOR_INIT(CGSizeMake(1280, 720));
    
    [self applicationDidFinishLaunching];
	[self.window setAcceptsMouseMovedEvents:NO];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *) theApplication
{
	return YES;
}

@end
