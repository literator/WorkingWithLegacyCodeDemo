#import <Foundation/Foundation.h>
#import "MOManager.h"

@class MOCoreDataStack;


@interface MOContactManager : NSObject <MOManager>
- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack;

- (void)saveDataToModel:(id)responseObject;
@end
