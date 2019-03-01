//
//  ViewController.m
//  NavTransportAnimation
//
//  Created by 智取 on 2019/2/23.
//  Copyright © 2019 智取. All rights reserved.
//

#import "ViewController.h"
#import "TransitionNavigationPerformer.h"
#import "FirstViewController.h"
//#import "TransitionNavigationPerformer.h"
#import "NextViewController.h"
#import "TransitionImgNavigationPerformer.h"


#import "NavigationPerfomer.h"

@interface ViewController ()
@property (nonatomic, strong) TransitionNavigationPerformer *navPer;
@property (nonatomic, strong) TransitionImgNavigationPerformer *imgPerNav;

@property (nonatomic, strong) NavigationPerfomer *navDele;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    _navPer = [[TransitionNavigationPerformer alloc] initWithNav:self.navigationController];


    _navDele = [[NavigationPerfomer alloc] initWithNav:self.navigationController];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.delegate = nil;//必须这个位置取消代理 不然 其他页面通用跳转会崩溃
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.delegate = nil;//必须这个位置取消代理 不然 其他页面通用跳转会崩溃
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"缩小动画";
    }else{
        cell.textLabel.text = @"展开";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        self.navigationController.delegate = _navDele; //需要在这里设置代理
        FirstViewController *vc = [[FirstViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        self.navigationController.delegate = _navPer;
        NextViewController *vc = [[NextViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
@end
