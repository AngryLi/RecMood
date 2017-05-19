//
//  SPFBottomOrderInfoViewViewModel.m
//  RecMood
//
//  Created by 李亚洲 on 2017/5/17.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

#import "SPFBottomOrderInfoViewViewModel.h"

@implementation SPFBottomOrderInfoViewViewModel

- (void)updateCurrentModel:(orderInfoViewMode)mode
{
    _currentModel = mode;
    if (self.currentModel == orderInfoViewModeFull) {
        self.dataSource = @[@(cellAdress)];
    } else {
        self.dataSource = @[@(cellAdress)];
    }
}

- (cellType)cellTypeForSection:(NSUInteger)section rowIndex:(NSUInteger)cellIndex
{
    return self.dataSource[cellIndex].integerValue;
}

@end
