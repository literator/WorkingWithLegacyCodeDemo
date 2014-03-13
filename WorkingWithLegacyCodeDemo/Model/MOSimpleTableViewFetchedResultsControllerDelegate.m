#import "MOSimpleTableViewFetchedResultsControllerDelegate.h"


@implementation MOSimpleTableViewFetchedResultsControllerDelegate {
    UITableView *_tableView;
}

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
    }

    return self;
}

+ (instancetype)delegateWithTableView:(UITableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}

#pragma mark - NSFetchedResultsController delegate methods

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    UITableViewRowAnimation rowAnimation = UITableViewRowAnimationFade;

    NSInteger section = 0;

    NSIndexPath *translatedIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:section];
    NSIndexPath *translatedNewIndexPath = [NSIndexPath indexPathForRow:newIndexPath.row inSection:section];

    switch (type) {
        case NSFetchedResultsChangeInsert:
            [_tableView insertRowsAtIndexPaths:@[translatedNewIndexPath] withRowAnimation:rowAnimation];
            break;
        case NSFetchedResultsChangeDelete:
            [_tableView deleteRowsAtIndexPaths:@[translatedIndexPath] withRowAnimation:rowAnimation];
            break;
        case NSFetchedResultsChangeMove:
            [_tableView deleteRowsAtIndexPaths:@[translatedIndexPath] withRowAnimation:rowAnimation];
            [_tableView insertRowsAtIndexPaths:@[translatedNewIndexPath] withRowAnimation:rowAnimation];
            break;
        case NSFetchedResultsChangeUpdate: {
            [_tableView reloadRowsAtIndexPaths:@[translatedIndexPath] withRowAnimation:rowAnimation];
            break;
        }
        default:
            break;
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [_tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [_tableView endUpdates];
}

@end
