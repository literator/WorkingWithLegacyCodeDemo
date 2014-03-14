#import <Foundation/Foundation.h>

@class MOCoreDataStack;

@protocol MOManager <NSObject>
- (MOCoreDataStack *)coreDataStack;
- (void)updateData;
@end
