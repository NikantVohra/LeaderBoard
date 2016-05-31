//
//  LeaderboardService.h
//  Leaderboard
//
//  Created by Vohra, Nikant on 5/30/16.
//  Copyright © 2016 Vohra, Nikant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeaderboardService : NSObject

-(void)fetchTopLeaderboardUsers:(void(^)(NSArray *users, NSError *error))completion;
-(void)fetchMyLeaderboardUsers:(void(^)(NSArray *users, NSError *error))completion;

@end
