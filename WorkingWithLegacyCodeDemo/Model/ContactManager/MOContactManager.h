#import <Foundation/Foundation.h>
#import "MOManager.h"

@class MOCoreDataStack;
@protocol MONetworking;

@interface MOContactManager : NSObject <MOManager>
- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack
                    networkingManager:(id <MONetworking>)networkingManager;

- (void)saveDataToModel:(id)responseObject;
@end
