#import "MOMainView.h"


@implementation MOMainView {

    BOOL _didSetupConstraints;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.viewLastButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.viewLastButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.viewLastButton setTitle:@"View Last Contacts" forState:UIControlStateNormal];
        [self.viewLastButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self addSubview:self.viewLastButton];

        self.downloadNewButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.downloadNewButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.downloadNewButton setTitle:@"Download more contacts & view" forState:UIControlStateNormal];
        [self.downloadNewButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [self addSubview:self.downloadNewButton];
    }

    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    if (!_didSetupConstraints) {
        _didSetupConstraints = YES;

        NSDictionary *views = @{
                @"last" : self.viewLastButton,
                @"download" : self.downloadNewButton
        };

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[last]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:views]];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[download]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:views]];

        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[download]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:views]];

        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.viewLastButton
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    }
}

@end
