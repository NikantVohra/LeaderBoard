//
//  LeaderboardService.m
//  Leaderboard
//
//  Created by Vohra, Nikant on 5/30/16.
//  Copyright © 2016 Vohra, Nikant. All rights reserved.
//

#import "LeaderboardService.h"
@implementation LeaderboardService

NSString *const apiURL = @"http://127.0.0.1:8081/";

-(void)fetchTopLeaderboardUsers:(void(^)(NSArray *users, NSError *error))completion {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:apiURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error) {
            NSError* conversionError;
            
            NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&conversionError];
            if(!conversionError) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(json, nil);
                });
            }
            
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });

        }
    }]resume];
}

-(void)fetchMyLeaderboardUsers:(void(^)(NSArray *users, NSError *error))completion{
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:apiURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(!error) {
            NSError* conversionError;
            
            NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                            options:kNilOptions
                                                              error:&conversionError];
            if(!conversionError) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(json, nil);
                });
            }
            
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
            
        }
    }]resume];
}



@end
