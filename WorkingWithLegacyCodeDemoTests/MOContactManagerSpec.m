#import <Kiwi/Kiwi.h>
#import <PLCoreDataUtils/NSManagedObjectContext+PLCoreDataUtils.h>

#import "MOContactManager.h"
#import "MOCoreDataStack.h"
#import "MOSpecHelperCoreDataStack.h"
#import "MOContactDataGroup.h"
#import "MOContactData.h"
#import "MOSpecHelperNetworkingManager.h"

SPEC_BEGIN(MOContactManagerSpec)

describe(@"MOContactManager", ^{
    __block MOContactManager *manager;
    __block MOCoreDataStack *coreDataStack;
    __block MOSpecHelperNetworkingManager *networkingManager;

    beforeEach(^{
        coreDataStack = [[MOSpecHelperCoreDataStack alloc] init];
        networkingManager = [[MOSpecHelperNetworkingManager alloc] init];
        manager = [[MOContactManager alloc] initWithCoreDataStack:coreDataStack
                                                networkingManager:networkingManager];
    });

    describe(@"saving data to model", ^{

        beforeEach(^{

            NSDictionary *responseObject = @{
                    @"response" : @[
                            @{
                                    @"name" : @"John",
                                    @"surname" : @"Jackson",
                                    @"role" : @1,
                            }
                    ]
            };

            [manager saveDataToModel:responseObject];

        });

        it(@"should contain one Contact Data Group object", ^{
            NSArray *contactGroups = [coreDataStack.mainContext fetchObjectsWithEntityName:NSStringFromClass([MOContactDataGroup class]) predicate:nil];
            [[contactGroups should] haveCountOf:1];
        });

        it(@"should contain one Contact Data object", ^{
            NSArray *contacts = [coreDataStack.mainContext fetchObjectsWithEntityName:NSStringFromClass([MOContactData class]) predicate:nil];
            [[contacts should] haveCountOf:1];
        });

    });

    describe(@"while updating should handle response properly", ^{

        beforeEach(^{

            NSDictionary *responseObject = @{
                    @"response" : @[
                            @{
                                    @"name" : @"John",
                                    @"surname" : @"Jackson",
                                    @"role" : @1,
                            }
                    ]
            };

            networkingManager.responseObject = responseObject;

            [manager updateData];
        });

        it(@"should contain one Contact Data Group object", ^{
            NSArray *contactGroups = [coreDataStack.mainContext fetchObjectsWithEntityName:NSStringFromClass([MOContactDataGroup class]) predicate:nil];
            [[contactGroups should] haveCountOf:1];
        });

        it(@"should contain one Contact Data object", ^{
            NSArray *contacts = [coreDataStack.mainContext fetchObjectsWithEntityName:NSStringFromClass([MOContactData class]) predicate:nil];
            [[contacts should] haveCountOf:1];
        });

    });

});

SPEC_END
