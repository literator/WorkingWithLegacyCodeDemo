#import <PLCoreDataUtils/NSManagedObjectContext+PLCoreDataUtils.h>
#import "MOListViewController.h"
#import "MOContactDataGroup.h"
#import "MOSimpleTableViewFetchedResultsControllerDelegate.h"
#import "MOContactData.h"
#import "MOManager.h"
#import "MOCoreDataStack.h"

@interface MOListViewController ()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property(nonatomic, readonly) id <MOManager> manager;
@end

@implementation MOListViewController {

}

- (instancetype)initWithManager:(id <MOManager>)manager {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _manager = manager;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self setupTableView];
    [self setupFetchedResultsController];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    [self.tableView reloadData];
}

- (void)setupFetchedResultsController {
    NSManagedObjectContext *context = self.manager.coreDataStack.mainContext;

    NSArray *groups = [context fetchObjectsWithEntityName:NSStringFromClass([MOContactDataGroup class])
                                                predicate:nil
                                                 orderKey:@"fetchDate"];

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([MOContactData class])];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"group == %@", [groups lastObject]];

    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:context
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    MOSimpleTableViewFetchedResultsControllerDelegate *delegate = [MOSimpleTableViewFetchedResultsControllerDelegate delegateWithTableView:self.tableView];
    self.fetchedResultsController.delegate = delegate;

    [self.fetchedResultsController performFetch:nil];
}

#pragma mark - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fetchedResultsController.fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    MOContactData *contactData = self.fetchedResultsController.fetchedObjects[(NSUInteger) indexPath.row];
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", contactData.name, contactData.surname];

    return cell;
}

@end
