//
//  GMLHelper.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "cocos2d.h"

#define GMLGameOverColor [UIColor colorWithRed:0.23 green:0.62 blue:0.57 alpha:1.0]

static const ccColor3B GMLTitleTextColor = {245, 140, 18};

@protocol GMLGameOverDelegate

-(void)gameOverHappened;

@end
