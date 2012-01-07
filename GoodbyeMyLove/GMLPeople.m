//
//  GMLPeople.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <AddressBook/AddressBook.h>

#import "GMLLovedOne.h"
#import "GMLPeople.h"
#import "VUMacSupport.h"

@implementation GMLPeople

+(NSMutableArray*)staticNames {
    NSMutableArray* names = [NSMutableArray arrayWithCapacity:20];
    [names addObject:@"Jacob"];
    [names addObject:@"Isabella"];
    [names addObject:@"Ethan"];
    [names addObject:@"Sophia"];
    [names addObject:@"Michael"];
    [names addObject:@"Emma"];
    [names addObject:@"Jayden"];
    [names addObject:@"Olivia"];
    [names addObject:@"William"];
    [names addObject:@"Ava"];
    [names addObject:@"Alexander"];
    [names addObject:@"Emily"];
    [names addObject:@"Noah"];
    [names addObject:@"Abigail"];
    [names addObject:@"Daniel"];
    [names addObject:@"Madison"];
    [names addObject:@"Aiden"];
    [names addObject:@"Chloe"];
    [names addObject:@"Anthony"];
    [names addObject:@"Mia"];
    return names;
}

+(NSArray*)lovedOnesWithLimit:(NSUInteger)limit {
    NSMutableArray* lovedOnes = [NSMutableArray array];
    
    VUAddressBook* addressBook = [VUAddressBook sharedAddressBook];
    NSMutableArray* abNames = [NSMutableArray array];
    for (VUPerson* person in addressBook.people) {
        NSString* name = [person valueForProperty:kVUFirstNameProperty];
        if (name) {
            [abNames addObject:name];
        }
    }
    
    BOOL fromAB = YES;
    if (abNames.count <= limit) {
        for (NSString* name in abNames) {
            [lovedOnes addObject:[GMLLovedOne lovedOneWithName:name fromAddressBook:fromAB]];
        }
        
        abNames = [self staticNames];
        fromAB = NO;
    }
        
    for (NSUInteger i = lovedOnes.count; i < limit; i++) {
        NSString* name = [abNames objectAtIndex:arc4random() % abNames.count];
        [lovedOnes addObject:[GMLLovedOne lovedOneWithName:name fromAddressBook:fromAB]];
    }
    
    NSAssert(lovedOnes.count == limit, @"Not enough names were generated.");
    return lovedOnes;
}

@end
