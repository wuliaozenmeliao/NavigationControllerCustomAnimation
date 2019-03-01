//
//  TransitionImgNavigationPerformer.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/27.
//  Copyright © 2019 智取. All rights reserved.
//

#import "TransitionImgNavigationPerformer.h"

@implementation TransitionImgNavigationPerformer
- (instancetype)initWithNav:(id)nav
{
    if (self = [super init]) {
        self.navigationController = nav;
        
        self.pushAnimation = [[TransitionImgAnimation alloc] init];
        
        self.popAnimation = [[TransitionImgPopAnimation alloc] init];
    }
    return self;
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
@end
