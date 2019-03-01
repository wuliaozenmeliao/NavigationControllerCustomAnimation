//
//  TransitionImgAnimation.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/27.
//  Copyright © 2019 智取. All rights reserved.
//

#import "TransitionImgAnimation.h"

@implementation TransitionImgAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //获得vc的frame finalFrameForViewController
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];

    
    [[transitionContext containerView] addSubview:fromVC.view];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    toVC.view.hidden = YES;
    UIView *fVC = [[UIView alloc] initWithFrame:CGRectMake(fromVC.view.center.x, fromVC.view.center.y, 100, 100)];
    fVC.backgroundColor = [UIColor redColor];
    
    [fromVC.view addSubview:fVC];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
        fVC.frame = finalFrame;
        
    } completion:^(BOOL finished) {
        [fVC removeFromSuperview];
        
        toVC.view.hidden = NO;
        [transitionContext completeTransition:YES];
    }];

}
@end

@implementation TransitionImgPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //获得vc的frame finalFrameForViewController
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *fVC = [[UIView alloc] init];
    fVC.frame = finalFrame;
    fVC.backgroundColor = [UIColor redColor];
    
    [[transitionContext containerView] addSubview:fromVC.view];
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    fromVC.view.hidden = YES;
    
    [toVC.view addSubview:fVC];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fVC.frame = CGRectMake(toVC.view.center.x, toVC.view.center.y, 100, 100);
    } completion:^(BOOL finished) {
        [fVC removeFromSuperview];
        fromVC.view.hidden = NO;
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
