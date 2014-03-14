#import "MOContactManager.h"
#import "MOCoreDataStack.h"


@interface MOContactManager ()
@property(nonatomic, readonly) MOCoreDataStack *coreDataStack;
@end

@implementation MOContactManager

- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack {
    self = [super init];
    if (self) {
        _coreDataStack = coreDataStack;
    }

    return self;
}

- (void)updateData {

}

- (void)saveDataToModel:(id)responseObject {

}

@end
