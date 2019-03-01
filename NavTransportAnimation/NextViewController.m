//
//  NextViewController.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/27.
//  Copyright © 2019 智取. All rights reserved.
//

#import "NextViewController.h"
#import "TransitionNavigationPerformer.h"
@interface NextViewController ()
{
    TransitionNavigationPerformer *nav;
}
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nav = [[TransitionNavigationPerformer alloc] initWithNav:self.navigationController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = nav;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
