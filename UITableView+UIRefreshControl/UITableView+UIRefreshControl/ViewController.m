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
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.tintColor = self.view.tintColor;
    [_refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    
    UITableViewController *tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    tableVC.refreshControl = _refreshControl;
    [self addChildViewController:tableVC];
     tableVC.tableView = _tableView;
    [self.view addSubview:tableVC.tableView];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.contentView.bounds];
    return cell;
}
@end
