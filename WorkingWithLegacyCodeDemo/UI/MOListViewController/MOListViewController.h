#import <Foundation/Foundation.h>

@protocol MOManager;

@interface MOListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithManager:(id <MOManager>)manager;

@end
