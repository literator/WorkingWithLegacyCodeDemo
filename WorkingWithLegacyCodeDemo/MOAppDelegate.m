#import "MOAppDelegate.h"
#import "MOMainViewController.h"
#import "MOCoreDataStack.h"
#import "MOManager.h"
#import "MOContactManager.h"
#import "MONetworking.h"
#import "MONetworkingManager.h"

@interface MOAppDelegate ()
@property(nonatomic, strong) MOCoreDataStack *coreDataStack;
@property(nonatomic, strong) id <MONetworking> networkingManager;
@end

@implementation MOAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    id <MOManager> contactsManager = [[MOContactManager alloc] initWithCoreDataStack:self.coreDataStack
                                                                   networkingManager:self.networkingManager];
    MOMainViewController *mainViewController = [[MOMainViewController alloc] initWithManager:contactsManager];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (MOCoreDataStack *)coreDataStack {
    if (!_coreDataStack) {
        _coreDataStack = [[MOCoreDataStack alloc] init];
    }
    return _coreDataStack;
}

- (id <MONetworking>)networkingManager {
    if (!_networkingManager) {
        _networkingManager = [[MONetworkingManager alloc] init];
    }
    return _networkingManager;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.coreDataStack.backgroundContext save:nil];
}

@end
