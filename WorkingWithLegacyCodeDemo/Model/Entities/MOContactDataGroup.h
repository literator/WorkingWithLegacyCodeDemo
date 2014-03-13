//
//  MOContactDataGroup.h
//  WorkingWithLegacyCodeDemo
//
//  Created by Maciej Oczko on 14.03.2014.
//  Copyright (c) 2014 Maciej Oczko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MOContactData;

@interface MOContactDataGroup : NSManagedObject

@property (nonatomic) NSTimeInterval fetchDate;
@property (nonatomic, retain) NSSet *contacts;
@end

@interface MOContactDataGroup (CoreDataGeneratedAccessors)

- (void)addContactsObject:(MOContactData *)value;
- (void)removeContactsObject:(MOContactData *)value;
- (void)addContacts:(NSSet *)values;
- (void)removeContacts:(NSSet *)values;

@end
