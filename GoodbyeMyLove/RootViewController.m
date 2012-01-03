//
//  RootViewController.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"

#import "RootViewController.h"

@implementation RootViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        [[CCDirector sharedDirector] setDeviceOrientation:kCCDeviceOrientationPortrait];
    } else if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        [[CCDirector sharedDirector] setDeviceOrientation:kCCDeviceOrientationPortraitUpsideDown];
    }
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
