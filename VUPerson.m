//
//  VUPerson.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 06.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "VUPerson.h"

@interface VUPerson ()

@property (nonatomic, assign) ABRecordRef recordRef;

@end

@implementation VUPerson

@synthesize recordRef;

-(id)initWithABRecordRef:(ABRecordRef)record {
    self = [super init];
    if (self) {
        self.recordRef = record;
    }
    return self;
}

-(id)valueForProperty:(ABPropertyID)propertyId {
    return (__bridge_transfer id)ABRecordCopyValue(self.recordRef, propertyId);
}

@end
