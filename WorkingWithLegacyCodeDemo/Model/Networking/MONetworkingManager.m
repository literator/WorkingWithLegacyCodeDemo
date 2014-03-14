#import "MONetworkingManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"


@interface MONetworkingManager ()
@property(nonatomic, readonly) AFHTTPRequestOperationManager *manager;
@end

@implementation MONetworkingManager {

}

- (id)init {
    self = [super init];
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
    }

    return self;
}

- (void)performCallToEndpoint:(NSString *)endpoint
                      success:(void (^)(AFHTTPRequestOperation *, id))success
                      failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    NSString *address = [NSString stringWithFormat:@"http://localhost:8080/%@", endpoint];
    [self.manager GET:address
           parameters:nil
              success:success
              failure:failure];
}

@end
