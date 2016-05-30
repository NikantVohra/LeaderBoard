//
//  AppDelegate.h
//  Leaderboard
//
//  Created by Vohra, Nikant on 5/30/16.
//  Copyright © 2016 Vohra, Nikant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong) NSManagedObjectContext *managedObjectContext;


@end

