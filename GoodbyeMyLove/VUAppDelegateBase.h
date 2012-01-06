//
//  VUAppDelegateBase.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>

@interface VUAppDelegateBase : UIResponder
#else
@interface VUAppDelegateBase : NSObject
#endif

-(void)applicationDidBecomeActive;
-(void)applicationDidEnterBackground;
-(void)applicationDidFinishLaunching;
-(void)applicationDidReceiveMemoryWarning;
-(void)applicationSignificantTimeChange;
-(void)applicationWillEnterForeground;
-(void)applicationWillResignActive;
-(void)applicationWillTerminate;

@end
