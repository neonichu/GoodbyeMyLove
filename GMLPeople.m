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

+(NSArray*)namesWithLimit:(NSUInteger)limit {
    NSMutableArray* names = [NSMutableArray array];
    
    VUAddressBook* addressBook = [VUAddressBook sharedAddressBook];
    
    for (VUPerson* person in addressBook.people) {
        NSString* name = [person valueForProperty:kVUFirstNameProperty];
        if (!name) {
            continue;
        }
        [names addObject:name];
        if (names.count == limit) break;
    }
    
    for (NSUInteger i = names.count; i < limit; i++) {
        // TODO: Fetch random names from somewhere
    }
    
    NSAssert(names.count == limit, @"Not enough names were generated.");
    return names;
}

@end
