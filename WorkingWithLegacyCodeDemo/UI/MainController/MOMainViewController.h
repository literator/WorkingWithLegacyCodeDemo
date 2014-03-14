#import <Foundation/Foundation.h>

@protocol MOManager;

@interface MOMainViewController : UIViewController
- (instancetype)initWithManager:(id <MOManager>)manager;
@end
