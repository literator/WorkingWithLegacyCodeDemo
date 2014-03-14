#import <Foundation/Foundation.h>
#import "MOManager.h"

@class MOCoreDataStack;
@protocol MONetworking;

@interface MOContactManager : NSObject <MOManager>
@property(nonatomic, readonly) MOCoreDataStack *coreDataStack;
@property(nonatomic, readonly) id <MONetworking> networkingManager;

- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack
                    networkingManager:(id <MONetworking>)networkingManager;

- (void)saveDataToModel:(id)responseObject;
@end
