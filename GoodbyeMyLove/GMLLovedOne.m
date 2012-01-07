//
//  GMLLovedOne.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLLovedOne.h"

@implementation GMLLovedOne

// TODO: random generated dudes

@synthesize fromAddressBook;
@dynamic isLovedOne;
@synthesize name;
@synthesize points;

#pragma mark -

+(id)lovedOne {
    return [self spriteWithFile:@"dude2.png"];
}

+(id)lovedOneWithName:(NSString*)name fromAddressBook:(BOOL)fromAddressBook {
    id result = [self lovedOne];
    [result setFromAddressBook:fromAddressBook];
    [result setName:name];
    return result;
}

#pragma mark -

-(BOOL)isLovedOne {
    return self.points > 0;
}

@end
