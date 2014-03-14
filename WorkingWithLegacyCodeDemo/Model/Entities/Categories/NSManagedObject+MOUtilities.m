#import <PLCoreDataUtils/NSManagedObjectContext+PLCoreDataUtils.h>
#import "NSManagedObject+MOUtilities.h"
#import "NSObject+MOUtilities.h"


@implementation NSManagedObject (MOUtilities)

+ (instancetype)insertEntityInContext:(NSManagedObjectContext *)context {
    return [context insertNewEntityWithName:[self classString]];
}

@end
