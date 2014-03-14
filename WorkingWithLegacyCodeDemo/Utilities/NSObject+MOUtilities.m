#import "NSObject+MOUtilities.h"


@implementation NSObject (MOUtilities)


+ (NSString *)classString {
    return NSStringFromClass([self class]);
}

- (NSString *)classString {
    return NSStringFromClass([self class]);
}

@end
