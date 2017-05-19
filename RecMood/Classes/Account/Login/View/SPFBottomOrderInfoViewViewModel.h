//
//  SPFBottomOrderInfoViewViewModel.h
//  RecMood
//
//  Created by 李亚洲 on 2017/5/17.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    orderInfoViewModeAdress,
    orderInfoViewModeFull,
} orderInfoViewMode;

typedef enum : NSUInteger {
    cellAdress,
} cellType;

@interface SPFBottomOrderInfoViewViewModel : NSObject

@property (strong, nonatomic) NSArray<NSNumber *> *dataSource;

@property (assign, nonatomic, readonly) orderInfoViewMode currentModel;
- (void)updateCurrentModel:(orderInfoViewMode)mode;

- (cellType)cellTypeForSection:(NSUInteger)section rowIndex:(NSUInteger)cellIndex;

@end
