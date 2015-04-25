//
//  ViewController.m
//  UITableView+UIRefreshControl
//
//  Created by lipeng on 15/4/25.
//  Copyright (c) 2015年 lipeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.tintColor = self.view.tintColor;
    [_refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    
    //function 1
    //[_tableView addSubview:_refreshControl];
    //[self.view addSubview:_tableView];
    
    //functoin 2
    //_tableView.hidden = YES;
    
    UITableViewController *tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableVC.refreshControl = _refreshControl;
    [self addChildViewController:tableVC];
    _tableView = tableVC.tableView;
    [self.view addSubview:_tableView];
//    [self.view addSubview:tableVC.tableView];
}

-(void) refreshData
{
    [self performSelector:@selector(endRefreshing) withObject:nil afterDelay:1];
}

- (void) endRefreshing
{
    [_refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
