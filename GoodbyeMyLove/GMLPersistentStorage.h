//
//  GMLPersistentStorage.h
//  GoodbyeMyLove
//
//  Created by Boris Bügling on 07.01.12.
//  Copyright (c) 2012 Crocodil.us. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

#define kAchievementForeverAlone    @"org.vu0.goodbyemylove.foreveralone"
#define kAchievementFullHouse       @"org.vu0.goodbyemylove.fullhouse"
#define kAchievementHipster         @"org.vu0.goodbyemylove.hipster"
#define kLeaderboardId              @"org.vu0.goodbyemylove"


@protocol GameCenterManagerDelegate <NSObject>

-(void)achievementSubmitted:(GKAchievement*)achievement error:(NSError*)error;
-(void)processGameCenterAuthWithError:(NSError*)error;

@end

#pragma mark -

@interface GMLPersistentStorage : NSObject

@property (nonatomic, assign) id<GameCenterManagerDelegate> delegate;

@property (nonatomic, assign) NSUInteger maximumLevelReached;
@property (nonatomic, assign) NSUInteger maximumScore;
@property (nonatomic, assign) NSUInteger numberOfPeopleFromABKilled;
@property (nonatomic, assign) NSUInteger numberOfPeopleFromABSaved;
@property (nonatomic, assign) NSUInteger numberOfPeopleKilled;
@property (nonatomic, assign) NSUInteger numberOfPeopleSaved;
@property (nonatomic, assign) NSUInteger timePlayed;
@property (nonatomic, assign) NSUInteger timeTouchedAsteroid;

-(void)authenticateLocalUser;

@end
