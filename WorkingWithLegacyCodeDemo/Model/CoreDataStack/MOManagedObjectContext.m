#import "MOManagedObjectContext.h"


@implementation MOManagedObjectContext {

}

- (BOOL)save:(NSError **)error {
    __block BOOL saved = [super save:error];
    if (saved && self.parentContext) {
        [self.parentContext performBlockAndWait:^{
            saved = [self.parentContext save:error];
        }];
    }
    return saved;
}

@end
