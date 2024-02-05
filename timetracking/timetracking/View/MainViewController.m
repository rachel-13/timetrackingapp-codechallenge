//
//  MainViewController.m
//  timetracking
//
//  Created by pohz on 05/02/2024.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"

@interface MainViewController()

@end

@implementation MainViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState: UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self
               action:@selector(buttonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button.heightAnchor constraintEqualToConstant:50].active = YES;
    [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}

-(void) buttonClicked: (UIButton*)sender {
    NSLog(@"start button clicked");
}


@end
