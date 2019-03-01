//
//  UIViewController+SnapShot.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/27.
//  Copyright © 2019 智取. All rights reserved.
//

#import "UIViewController+SnapShot.h"
#import <objc/runtime.h>
@implementation UIViewController (SnapShot)

- (UIView*)snapShot
{
    UIView *view = objc_getAssociatedObject(self, @"SnapShot");
    
    if (!view) {
        view = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
        [self setSnapShot:view];
    }
    return view;
}

- (void)setSnapShot:(UIView *)snapShot
{
    objc_setAssociatedObject(self, @"SnapShot", snapShot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
