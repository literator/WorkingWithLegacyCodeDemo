#import "MOSpecHelperNetworkingManager.h"
#import "AFHTTPRequestOperation.h"


@implementation MOSpecHelperNetworkingManager {

}

- (void)performCallToEndpoint:(NSString *)endpoint
                      success:(void (^)(AFHTTPRequestOperation *, id))success
                      failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    if (!self.shouldFail && success) {
        success(nil, self.responseObject);
    } else if (failure) {
        failure(nil, nil);
    }
}

@end
