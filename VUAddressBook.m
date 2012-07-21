//
//  VUAddressBook.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <AddressBook/AddressBook.h>

#import "VUAddressBook.h"
#import "VUPerson.h"

@implementation VUAddressBook

+ (id)sharedAddressBook
{
    static dispatch_once_t pred;
    static VUAddressBook *book = nil;
    
    dispatch_once(&pred, ^{ book = [[self alloc] init]; });
    return book;
}

- (NSArray*)people {
    ABAddressBookRef addressBook = ABAddressBookCreate();
    NSArray* entries = (__bridge_transfer NSArray*)ABAddressBookCopyArrayOfAllPeople(addressBook);
    NSMutableArray* people = [NSMutableArray arrayWithCapacity:entries.count];
    for (id entry in entries) {
        [people addObject:[[VUPerson alloc] initWithABRecordRef:(__bridge ABRecordRef)entry]];
    }
    // FIXME: Copy values from ABRecordRef so that we can release the address book here.
    //CFRelease(addressBook);
    return people;
}

@end
