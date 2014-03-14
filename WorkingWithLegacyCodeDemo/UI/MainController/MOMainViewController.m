#import "MOMainViewController.h"
#import "MOMainView.h"
#import "AFHTTPRequestOperationManager.h"
#import "NSManagedObjectContext+PLCoreDataUtils.h"
#import "MOCoreDataStack.h"
#import "MOContactDataGroup.h"
#import "MOListViewController.h"
#import "MOContactData.h"

@interface MOMainViewController ()
@property(nonatomic, readonly) MOCoreDataStack* coreDataStack;
@end

@implementation MOMainViewController {

}
- (instancetype)initWithCoreDataStack:(MOCoreDataStack *)coreDataStack {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _coreDataStack = coreDataStack;
    }

    return self;
}

- (MOMainView *)castView {
    return (MOMainView *) self.view;
}

- (void)loadView {
    self.view = [[MOMainView alloc] initWithFrame:CGRectZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main View";
    [self.castView.viewLastButton addTarget:self action:@selector(didTapViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.castView.downloadNewButton addTarget:self action:@selector(didTapDownloadButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view setNeedsUpdateConstraints];
}

- (void)didTapDownloadButton:(UIButton *)button {
    [self updateData];
    [self showDetails];
}

- (void)didTapViewButton:(UIButton *)button {
    [self showDetails];
}

- (void)showDetails {
    MOListViewController *listViewController = [[MOListViewController alloc] initWithCoreDataStack:self.coreDataStack];
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (void)updateData {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://localhost:8080/contacts"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [self saveDataToModel:responseObject];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"error = %@", [error localizedDescription]);
         }];
}

- (void)saveDataToModel:(id)responseObject {
    NSArray *contactsData = responseObject[@"response"];
    NSManagedObjectContext *context = self.coreDataStack.mainContext;

    MOContactDataGroup *dataGroup = (MOContactDataGroup *) [context insertNewEntityWithName:NSStringFromClass([MOContactDataGroup class])];
    dataGroup.fetchDate = [NSDate timeIntervalSinceReferenceDate];
    for (NSDictionary *data in contactsData) {
        MOContactData *contactData = (MOContactData *) [context insertNewEntityWithName:NSStringFromClass([MOContactData class])];
        contactData.name = data[@"name"];
        contactData.surname = data[@"surname"];
        contactData.role = [data[@"role"] intValue];
        contactData.group = dataGroup;
    }
    NSError *error = nil;
    if(![context save:&error]) {
        NSLog(@"error = %@", [error localizedDescription]);
    }
}

@end
