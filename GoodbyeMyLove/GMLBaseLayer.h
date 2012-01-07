//
//  GMLBaseLayer.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"

@interface GMLBaseLayer : CCLayer

@property (nonatomic, assign) NSString* fontName;

+(CCScene*)scene;

-(CCLabelTTF*)addText:(NSString*)text color:(ccColor3B)color fontSize:(int)fontSize position:(CGPoint)position;
-(CCLabelTTF*)addText:(NSString*)text color:(ccColor3B)color fontSize:(int)fontSize position:(CGPoint)position 
           dimensions:(CGSize)dimensions;

-(void)gameLoop:(ccTime)time;

@end
