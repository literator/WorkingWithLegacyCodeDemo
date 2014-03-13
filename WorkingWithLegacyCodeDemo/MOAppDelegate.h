//
//  MOAppDelegate.h
//  WorkingWithLegacyCodeDemo
//
//  Created by Maciej Oczko on 13.03.2014.
//  Copyright (c) 2014 Maciej Oczko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
