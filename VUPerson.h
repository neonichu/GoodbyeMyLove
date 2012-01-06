//
//  VUPerson.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import <Foundation/Foundation.h>

@interface VUPerson : NSObject

-(id)initWithABRecordRef:(ABRecordRef)record;
-(id)valueForProperty:(ABPropertyID)propertyId;

@end
