#import <Foundation/Foundation.h>

@interface NSManagedObject (MOUtilities)
+ (instancetype)insertEntityInContext:(NSManagedObjectContext *)context;
@end
