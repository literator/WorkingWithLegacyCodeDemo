#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

@protocol MONetworking <NSObject>
- (void)performCallToEndpoint:(NSString *)endpoint
                      success:(void (^)(AFHTTPRequestOperation *, id))success
                      failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure;
@end
