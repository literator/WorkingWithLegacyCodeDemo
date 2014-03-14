#import "MOContactManager.h"
#import "MOCoreDataStack.h"
#import "MOContactData.h"
#import "NSManagedObjectContext+PLCoreDataUtils.h"
#import "MOContactDataGroup.h"
#import "MONetworking.h"


@implementation MOContactManager

- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack
                    networkingManager:(id <MONetworking>)networkingManager {
    self = [super init];
    if (self) {
        _coreDataStack = coreDataStack;
        _networkingManager = networkingManager;
    }

    return self;
}

- (void)updateData {
    [self.networkingManager performCallToEndpoint:@"contacts"
                                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                              [self saveDataToModel:responseObject];
                                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@", [error localizedDescription]);
    }];
}

- (void)saveDataToModel:(id)responseObject {
    NSArray *contactsData = responseObject[@"response"];
    NSManagedObjectContext *context = self.coreDataStack.mainContext;

    MOContactDataGroup *dataGroup = (MOContactDataGroup *) [context insertNewEntityWithName:NSStringFromClass([MOContactDataGroup class])];
    dataGroup.fetchDate = [NSDate timeIntervalSinceReferenceDate];
    for (NSDictionary *data in contactsData) {
        MOContactData *contactData = (MOContactData *) [context insertNewEntityWithName:NSStringFromClass([MOContactData class])];
        contactData.name = data[@"name"];
        contactData.surname = data[@"surname"];
        contactData.role = [data[@"role"] intValue];
        contactData.group = dataGroup;
    }
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"error = %@", [error localizedDescription]);
    }
}

@end
