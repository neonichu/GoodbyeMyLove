//
//  VUAddressBook.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VUAddressBook : NSObject

+ (id)sharedAddressBook;
- (NSArray*)people;

@end
