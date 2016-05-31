//
//  CoreDataHelper.h
//  Leaderboard
//
//  Created by Vohra, Nikant on 5/31/16.
//  Copyright © 2016 Vohra, Nikant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject

+(CoreDataHelper*)sharedInstance;

@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;
-(void)deleteAllInstancesOfEntity:(NSString *)entity;
-(void)initializeCoreData;


@end
