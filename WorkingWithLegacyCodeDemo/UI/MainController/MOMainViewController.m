#import "MOMainViewController.h"
#import "MOMainView.h"
#import "MOListViewController.h"
#import "MOManager.h"

@interface MOMainViewController ()
@property(nonatomic, readonly) id <MOManager> manager;
@end

@implementation MOMainViewController {

}
- (instancetype)initWithManager:(id <MOManager>)manager {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _manager = manager;
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
    [self.manager updateData];
    [self showDetails];
}

- (void)didTapViewButton:(UIButton *)button {
    [self showDetails];
}

- (void)showDetails {
    MOListViewController *listViewController = [[MOListViewController alloc] initWithManager:self.manager];
    [self.navigationController pushViewController:listViewController animated:YES];
}

@end
