//
//  MOContactData.h
//  WorkingWithLegacyCodeDemo
//
//  Created by Maciej Oczko on 14.03.2014.
//  Copyright (c) 2014 Maciej Oczko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MOContactDataGroup;

@interface MOContactData : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic) int32_t role;
@property (nonatomic, retain) MOContactDataGroup *group;

@end
