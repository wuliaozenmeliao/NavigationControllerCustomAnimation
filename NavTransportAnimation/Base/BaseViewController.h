//
//  BaseViewController.h
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
//@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

NS_ASSUME_NONNULL_END
