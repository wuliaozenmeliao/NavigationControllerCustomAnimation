//
//  FirstViewController.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import "FirstViewController.h"
#import "TransitionNavigationPerformer.h"

#import "NavigationPerfomer.h"
@interface FirstViewController ()<UIGestureRecognizerDelegate>
{
    TransitionNavigationPerformer *navigationPerFomer;
    NavigationPerfomer *navDele;
    
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    navDele = [[NavigationPerfomer alloc] initWithNav:self.navigationController];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = navDele;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil; //必须这个位置取消代理 不然 其他页面通用跳转会崩溃
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



//#pragma mark - UIPanGestureRecognizer handlexrs
//
//- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer {
//    
//    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
//    progress = MIN(1.0, MAX(0.0, progress));
//    
//    if (recognizer.state == UIGestureRecognizerStateBegan) {
//        
//        // Create a interactive transition and pop the view controller
//        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
//        
//        [self.navigationController popViewControllerAnimated:YES];
//    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
//        
//        // Update the interactive transition's progress
//        [self.interactivePopTransition updateInteractiveTransition:progress];
//    } else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
//        
//        // Finish or cancel the interactive transition
//        if (progress > 0.25) {
//            [self.interactivePopTransition finishInteractiveTransition];
//        } else {
//            [self.interactivePopTransition cancelInteractiveTransition];
//        }
//        
//        self.interactivePopTransition = nil;
//    }
//}
//
//- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)recognizer {
//    return [recognizer velocityInView:self.view].x > 0;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
