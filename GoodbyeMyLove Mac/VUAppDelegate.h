//
//  VUAppDelegate.h
//  GoodbyeMyLove Mac
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "VUAppDelegateBase.h"

@interface VUAppDelegate : VUAppDelegateBase <NSApplicationDelegate>

@property (strong) MacGLView* glView;
@property (strong) NSWindow* window;

@end
