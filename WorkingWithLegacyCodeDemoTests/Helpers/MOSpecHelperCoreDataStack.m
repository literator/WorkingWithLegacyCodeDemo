#import "MOSpecHelperCoreDataStack.h"
#import "MOManagedObjectContext.h"


@implementation MOSpecHelperCoreDataStack {

}

- (void)createPersistentStore {
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    [_persistentStoreCoordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil
                                                        URL:nil options:nil error:&error];
}

- (void)createMainContext {
    _mainContext = [[MOManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];

    if (_persistentStoreCoordinator && _mainContext) {
        _mainContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
        _mainContext.persistentStoreCoordinator = _persistentStoreCoordinator;

    } else {
        _mainContext = nil;
    }
}

- (void)createBackgroundContext {
    _backgroundContext = [[MOManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];

    if (_persistentStoreCoordinator && _backgroundContext) {
        _backgroundContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
        _backgroundContext.parentContext = _mainContext;
    }
}

@end
