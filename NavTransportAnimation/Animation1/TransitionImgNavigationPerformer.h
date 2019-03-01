//
//  TransitionImgNavigationPerformer.h
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/27.
//  Copyright © 2019 智取. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TransitionImgAnimation.h"
NS_ASSUME_NONNULL_BEGIN

@interface TransitionImgNavigationPerformer : NSObject<UINavigationControllerDelegate>
- (instancetype)initWithNav:(id)nav;
@property (weak, nonatomic)  UINavigationController *navigationController;
@property (nonatomic, strong)TransitionImgAnimation *pushAnimation;

@property (nonatomic, strong)TransitionImgPopAnimation *popAnimation;
@end

NS_ASSUME_NONNULL_END
