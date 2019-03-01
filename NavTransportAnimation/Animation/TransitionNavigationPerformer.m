//
//  TransitionNavigationPerformer.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import "TransitionNavigationPerformer.h"

@interface TransitionNavigationPerformer ()
{
    UIPanGestureRecognizer *panGesture;
}

@end

@implementation TransitionNavigationPerformer
- (instancetype)initWithNav:(id)nav
{
    if (self = [super init]) {
        self.navigationController = nav;
        
        // 在导航控制器的视图上添加pan手势 --> 需要从边缘进行拖动，在控制器转换的时候是有用 "UIScreenEdgePanGestureRecognizer"
        panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.navigationController.view addGestureRecognizer:panGesture];
        
        self.pushAnimation = [[TransitionPushAnimation alloc] init];
        
        self.popAnimation = [[TransitionPopAnimation alloc] init];
        
    }
    return self;
}
- (void)dealloc
{
    [panGesture removeTarget:self action:@selector(pan:)];
    self.interactionController = nil;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    UIView *view = self.navigationController.view;
    CGFloat progress = [recognizer translationInView:view].x / (view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // 创建过渡对象，弹出viewController
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        // 更新 interactive transition 的进度
        [self.interactionController updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        // 完成或者取消过渡
        if (progress > 0.5) {
            [self.interactionController finishInteractiveTransition];
        }
        else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }
    return nil;
}
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    
    // 检查是否是我们的自定义过渡
    if ([animationController isKindOfClass:[TransitionPopAnimation class]] || [animationController isKindOfClass:[TransitionPushAnimation class]]) {
        return self.interactionController;
    }
    else {
        return nil;
    }
}
@end
