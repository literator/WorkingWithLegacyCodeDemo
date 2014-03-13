#import <Foundation/Foundation.h>


@interface MOSimpleTableViewFetchedResultsControllerDelegate : NSObject <NSFetchedResultsControllerDelegate>
- (instancetype)initWithTableView:(UITableView *)tableView;
+ (instancetype)delegateWithTableView:(UITableView *)tableView;

@end
