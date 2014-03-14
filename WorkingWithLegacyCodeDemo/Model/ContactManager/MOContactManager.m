#import "MOContactManager.h"
#import "MOCoreDataStack.h"
#import "MOContactData.h"
#import "NSManagedObjectContext+PLCoreDataUtils.h"
#import "MOContactDataGroup.h"


@interface MOContactManager ()
@property(nonatomic, readonly) MOCoreDataStack *coreDataStack;
@end

@implementation MOContactManager

- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack {
    self = [super init];
    if (self) {
        _coreDataStack = coreDataStack;
    }

    return self;
}

- (void)updateData {

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
