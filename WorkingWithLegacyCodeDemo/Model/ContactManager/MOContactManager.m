#import "MOContactManager.h"
#import "MOCoreDataStack.h"
#import "MOContactData.h"
#import "MOContactDataGroup.h"
#import "MONetworking.h"
#import "NSManagedObject+MOUtilities.h"
#import "MOContactData+MOUtilities.h"


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
    NSManagedObjectContext *context = self.coreDataStack.backgroundContext;

    MOContactDataGroup *dataGroup = [MOContactDataGroup insertEntityInContext:context];
    dataGroup.fetchDate = [NSDate timeIntervalSinceReferenceDate];

    for (NSDictionary *data in contactsData) {
        MOContactData *contactData = [MOContactData insertEntityInContext:context];
        [contactData loadData:data];
        contactData.group = dataGroup;
    }

    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"error = %@", [error localizedDescription]);
    }
}

@end
