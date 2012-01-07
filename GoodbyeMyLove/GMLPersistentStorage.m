//
//  GMLPersistentStorage.m
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import "GMLPersistentStorage.h"

@interface GMLPersistentStorage ()

@property (nonatomic, retain) NSMutableDictionary* earnedAchievementCache;

-(void)submitAchievement:(NSString*)identifier percentComplete:(double)percentComplete;

@end

#pragma mark -

@implementation GMLPersistentStorage

@synthesize delegate;
@synthesize earnedAchievementCache;
@synthesize maximumLevelReached;
@synthesize maximumScore;
@synthesize numberOfPeopleFromABKilled;
@synthesize numberOfPeopleFromABSaved;
@synthesize numberOfPeopleKilled;
@synthesize numberOfPeopleSaved;
@synthesize timePlayed;
@synthesize timeTouchedAsteroid;

#pragma mark -
#pragma mark Helper methods

-(void)callDelegate:(SEL)selector withArg:(id)arg error:(NSError*)err {
	assert([NSThread isMainThread]);
    
	if([delegate respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
		if (arg) {
			[delegate performSelector:selector withObject:arg withObject:err];
		}
		else {
			[delegate performSelector:selector withObject:err];
		}
#pragma clang diagnostic pop
	} else {
		NSLog(@"Delegate %@ does not respond to selector %@", delegate, NSStringFromSelector(selector));
	}
}

-(void)callDelegateOnMainThread:(SEL)selector withArg:(id)arg error:(NSError*)err {
	dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self callDelegate:selector withArg:arg error:err];
    });
}

-(BOOL)earnedAchievement:(NSString*)identifier {
    GKAchievement* achievement = [self.earnedAchievementCache objectForKey:identifier];
    return achievement.percentComplete >= 100.0;
}

#pragma mark -
#pragma mark Persistent value handling

-(void)setNumberOfPeopleFromABSaved:(NSUInteger)numberOfPeopleFromABSaved_ {
    numberOfPeopleFromABSaved = numberOfPeopleFromABSaved_;
    
    if ([self earnedAchievement:kAchievementHipster]) return;
    
    double percentComplete = self.numberOfPeopleFromABSaved / 50.0;
    
    if (self.numberOfPeopleFromABSaved % 10 == 0) {
        [self submitAchievement:kAchievementHipster percentComplete:percentComplete];
    }
}

#pragma mark -
#pragma mark GameCenter handling methods

-(void)authenticateLocalUser {
	if([GKLocalPlayer localPlayer].authenticated == NO) {
		[[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError* error) {
            [self callDelegateOnMainThread:@selector(processGameCenterAuthWithError:) withArg:NULL error:error];
        }];
	}
}

-(void)submitAchievement:(NSString*)identifier percentComplete:(double)percentComplete {
	if (!self.earnedAchievementCache) {
		[GKAchievement loadAchievementsWithCompletionHandler:^(NSArray* scores, NSError* error) {
            if (!scores) return;
            
            NSMutableDictionary* tempCache= [NSMutableDictionary dictionaryWithCapacity:[scores count]];
            for (GKAchievement* score in scores) {
                [tempCache setObject:score forKey:score.identifier];
            }
            
            self.earnedAchievementCache = tempCache;
            [self submitAchievement:identifier percentComplete:percentComplete];
        }];
        return;
	}
    
    GKAchievement* achievement = [self.earnedAchievementCache objectForKey:identifier];
    if (achievement) return;
    
    achievement = [[GKAchievement alloc] initWithIdentifier:identifier];
    achievement.percentComplete = percentComplete;
    [self.earnedAchievementCache setObject:achievement forKey:achievement.identifier];
    
    [achievement reportAchievementWithCompletionHandler:^(NSError* error) {
         [self callDelegateOnMainThread:@selector(achievementSubmitted:error:) withArg:achievement error:error];
     }];
}

@end
