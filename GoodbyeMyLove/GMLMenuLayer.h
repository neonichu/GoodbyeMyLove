//
//  GMLMenuLayer.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 03.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <GameKit/GameKit.h>
#import <UIKit/UIKit.h>
#endif

#import "GMLBaseLayer.h"

#if TARGET_OS_IPHONE

@interface GMLMenuLayer : GMLBaseLayer <GKAchievementViewControllerDelegate>

@property (nonatomic, assign) UIViewController* rootVC;

#else

@interface GMLMenuLayer : GMLBaseLayer

#endif

@end
