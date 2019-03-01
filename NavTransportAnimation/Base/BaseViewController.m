//
//  BaseViewController.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong, readwrite) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTable];
    


}

- (void)createTable
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}
//#pragma mark - UIPanGestureRecognizer handlexrs
//
//- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer {
//    
//    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
//    progress = MIN(1.0, MAX(0.0, progress));
//    
//    
//    NSLog(@"11111");
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
