//
//  SPFBottomOrderInfoView.m
//  RecMood
//
//  Created by 李亚洲 on 2017/5/17.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

#import "SPFBottomOrderInfoView.h"
#import "SPFBottomOrderInfoViewViewModel.h"

#import "SPFBottomOrderInfoAdressCell.h"

#import <Masonry/Masonry.h>

#define SPFBottomOrderInfoAdressCellIdentifier @"SPFBottomOrderInfoAdressCell"

@interface SPFBottomOrderInfoView () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic, readwrite) SPFBottomOrderInfoViewViewModel *viewModel;

@end

@implementation SPFBottomOrderInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self renderSubViews];
    }
    return self;
}

#pragma mark - getter

- (void)renderSubViews
{
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SPFBottomOrderInfoAdressCell class]) bundle:nil] forCellReuseIdentifier:SPFBottomOrderInfoAdressCellIdentifier];
}

- (void)updateCurrentModel:(orderInfoViewMode)mode
{
    [self.viewModel updateCurrentModel:mode];
    [self.tableView reloadData];
}

#pragma mark - 代理实现

#pragma mark - table delegate

#pragma mark - table data source 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([self.viewModel cellTypeForSection:indexPath.section rowIndex:indexPath.row]) {
        case cellAdress:
        {
            SPFBottomOrderInfoAdressCell *cell = [tableView dequeueReusableCellWithIdentifier:SPFBottomOrderInfoAdressCellIdentifier forIndexPath:indexPath];
            return cell;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - getter

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

@end
