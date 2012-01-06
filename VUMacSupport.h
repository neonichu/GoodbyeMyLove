//
//  VUMacSupport.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#if TARGET_OS_IPHONE

#import "VUAddressBook.h"
#import "VUPerson.h"

#define kVUFirstNameProperty                kABPersonFirstNameProperty

#else

@class ABAddressBook;
@class ABPerson;

#define kVUFirstNameProperty                kABFirstNameProperty
#define UITextAlignmentCenter               NSLineBreakByWordWrapping

typedef ABAddressBook VUAddressBook;
typedef ABPerson VUPerson;

@protocol CCTargetedTouchDelegate <NSObject>
@end

#endif