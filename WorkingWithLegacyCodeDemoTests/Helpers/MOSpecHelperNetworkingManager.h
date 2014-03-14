#import <Foundation/Foundation.h>
#import "MONetworking.h"


@interface MOSpecHelperNetworkingManager : NSObject <MONetworking>
@property(nonatomic, getter=shouldFail) BOOL fail;
@property(nonatomic, strong) NSDictionary *responseObject;
@end
