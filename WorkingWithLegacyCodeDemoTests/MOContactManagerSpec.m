#import <Kiwi/Kiwi.h>

#import "MOContactManager.h"
#import "MOCoreDataStack.h"
#import "MOSpecHelperCoreDataStack.h"

SPEC_BEGIN(MOContactManagerSpec)

describe(@"MOContactManager", ^{
    __block MOContactManager *manager;

    beforeEach(^{
        MOCoreDataStack *coreDataStack = [[MOSpecHelperCoreDataStack alloc] init];

        manager = [[MOContactManager alloc] initWithCoreDataStack:coreDataStack];
    });

    describe(@"saving data to model", ^{

    });
});

SPEC_END
