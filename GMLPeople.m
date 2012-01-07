//
//  GMLPeople.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <AddressBook/AddressBook.h>

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

+(NSArray*)namesWithLimit:(NSUInteger)limit {
    NSMutableArray* names = [NSMutableArray array];
    
    VUAddressBook* addressBook = [VUAddressBook sharedAddressBook];
    NSMutableArray* abNames = [NSMutableArray array];
    for (VUPerson* person in addressBook.people) {
        NSString* name = [person valueForProperty:kVUFirstNameProperty];
        if (name) {
            [abNames addObject:name];
        }
    }
    
    if (abNames.count <= limit) {
        [names addObjectsFromArray:abNames];
        abNames = [self staticNames];
    }
        
    for (NSUInteger i = names.count; i < limit; i++) {
            [names addObject:[abNames objectAtIndex:arc4random() % abNames.count]];
    }
    
    NSAssert(names.count == limit, @"Not enough names were generated.");
    return names;
}

@end
