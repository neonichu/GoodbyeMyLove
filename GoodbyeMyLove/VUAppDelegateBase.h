//
//  VUAppDelegateBase.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCScene;
@class GMLPersistentStorage;

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>

@interface VUAppDelegateBase : UIResponder
#else
@interface VUAppDelegateBase : NSObject
#endif

@property (nonatomic, retain) GMLPersistentStorage* storage;

-(void)applicationDidBecomeActive;
-(void)applicationDidEnterBackground;
-(CCScene*)applicationDidFinishLaunching;
-(void)applicationDidReceiveMemoryWarning;
-(void)applicationSignificantTimeChange;
-(void)applicationWillEnterForeground;
-(void)applicationWillResignActive;
-(void)applicationWillTerminate;

@end
