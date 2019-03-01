//
//  TransitionNavigationPerformer.h
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TransitionPushAnimation.h"
NS_ASSUME_NONNULL_BEGIN

@interface TransitionNavigationPerformer : NSObject <UINavigationControllerDelegate>

- (instancetype)initWithNav:(id)nav;

@property (weak, nonatomic)  UINavigationController *navigationController;


//左滑退出
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactionController;


@property (nonatomic, strong)TransitionPushAnimation *pushAnimation;

@property (nonatomic, strong)TransitionPopAnimation *popAnimation;
@end

NS_ASSUME_NONNULL_END
