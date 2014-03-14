#import "MOContactData+MOUtilities.h"


@implementation MOContactData (MOUtilities)

- (void)loadData:(NSDictionary *)data {
    self.name = data[@"name"];
    self.surname = data[@"surname"];
    self.role = [data[@"role"] intValue];
}

@end
