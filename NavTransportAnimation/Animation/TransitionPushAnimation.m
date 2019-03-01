//
//  TransitionPushAnimation.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import "TransitionPushAnimation.h"
#import "UIViewController+SnapShot.h"
@implementation TransitionPushAnimation

//转场时间
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    UIViewController *fromViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIViewController *toViewController = (UIViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    fromViewController.view.hidden = YES;
    
    [[transitionContext containerView] addSubview:fromViewController.snapShot];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [[toViewController.navigationController.view superview] insertSubview:fromViewController.snapShot belowSubview:toViewController.navigationController.view];
    
    toViewController
    .navigationController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        fromViewController.snapShot.alpha = 0.5;
        fromViewController.snapShot.transform = CGAffineTransformMakeScale(0.9, 0.9);
        toViewController.navigationController.view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        fromViewController.view.hidden = NO;
        [fromViewController.snapShot removeFromSuperview];
        [toViewController.snapShot removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
}



@end

@implementation TransitionPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [fromVC.view addSubview:fromVC.snapShot];
    fromVC.navigationController.navigationBar.hidden = YES;
    fromVC.view.transform = CGAffineTransformMakeTranslation(0, 0);
    
    
    toVC.view.hidden = YES;
    toVC.snapShot.alpha = 0.3;
    toVC.snapShot.transform = CGAffineTransformMakeScale(0.9, 0.9);
    
    [[transitionContext containerView] addSubview:toVC.view];
    
    [[transitionContext containerView] addSubview:toVC.snapShot];
    
    [[transitionContext containerView] sendSubviewToBack:toVC.snapShot];
    
    
    
    
    
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
        toVC.snapShot.alpha = 1;
        toVC.snapShot.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
        toVC.navigationController.navigationBar.hidden = NO;
        
        toVC.view.hidden = NO;
        
        [fromVC.snapShot removeFromSuperview];
        [toVC.snapShot removeFromSuperview];
        fromVC.snapShot = nil;
        
        if (![transitionContext transitionWasCancelled]) {
            toVC.snapShot = nil;
        }
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
@implementation GesturesPopAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    [fromVc.view addSubview:fromVc.snapShot];
    fromVc.navigationController.navigationBar.hidden = YES;
    fromVc.view.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    
    toVc.view.hidden = YES;
    toVc.snapShot.alpha = 0.3;
    toVc.snapShot.transform = CGAffineTransformMakeScale(0.965, 0.965);
    
    [[transitionContext containerView] addSubview:toVc.view];
    [[transitionContext containerView] addSubview:toVc.snapShot];
    [[transitionContext containerView] sendSubviewToBack:toVc.snapShot];
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromVc.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                         toVc.snapShot.alpha = 1.0;
                         toVc.snapShot.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         
                         toVc.navigationController.navigationBar.hidden = NO;
                         toVc.view.hidden = NO;
                         
                         [fromVc.snapShot removeFromSuperview];
                         [toVc.snapShot removeFromSuperview];
                         fromVc.snapShot = nil;
                         
                         // Reset toViewController's `snapshot` to nil
                         if (![transitionContext transitionWasCancelled]) {
                             toVc.snapShot = nil;
                         }
                         
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}
@end
