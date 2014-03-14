#import "MOAppDelegate.h"
#import "MOMainViewController.h"
#import "MOCoreDataStack.h"

@interface MOAppDelegate ()
@property(nonatomic, strong) MOCoreDataStack *coreDataStack;
@end

@implementation MOAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MOMainViewController *mainViewController = [[MOMainViewController alloc] initWithCoreDataStack:self.coreDataStack];
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
