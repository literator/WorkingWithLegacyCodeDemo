#import <Foundation/Foundation.h>

@class MOCoreDataStack;

@interface MOListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack;

@end
