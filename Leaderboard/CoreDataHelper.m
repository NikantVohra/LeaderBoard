//
//  CoreDataHelper.m
//  Leaderboard
//
//  Created by Vohra, Nikant on 5/31/16.
//  Copyright © 2016 Vohra, Nikant. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

static CoreDataHelper* sharedInstance = nil;

+(CoreDataHelper*)sharedInstance
{
    @synchronized([CoreDataHelper class])
    {
        if (!sharedInstance){
            sharedInstance = [[self alloc] init];
            [sharedInstance initializeCoreData];
            
        }
        return sharedInstance;
    }
    
    return nil;
}

- (void)initializeCoreData
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataModel" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    [self setManagedObjectContext:moc];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}



-(void)deleteAllInstancesOfEntity:(NSString *)entity {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:entity];
    [fetchRequest setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects)
    {
        [self.managedObjectContext deleteObject:object];
    }
    
    error = nil;
    [self.managedObjectContext save:&error];
}

@end
