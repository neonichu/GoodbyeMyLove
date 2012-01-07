//
//  GMLLovedOne.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "cocos2d.h"

@interface GMLLovedOne : CCSprite

@property (nonatomic, assign) BOOL fromAddressBook;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, assign) NSUInteger points;

@property (nonatomic, readonly) BOOL isLovedOne;

+(id)lovedOne;
+(id)lovedOneWithName:(NSString*)name fromAddressBook:(BOOL)fromAddressBook;

@end
