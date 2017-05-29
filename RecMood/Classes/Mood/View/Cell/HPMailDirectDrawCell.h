//
//  HPMailDirectDrawCell.h
//  RecMood
//
//  Created by 李亚洲 on 2017/5/21.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HPMailDirectDrawCellStatus) {
    HPMailDirectDrawCellStatusUnread,
    HPMailDirectDrawCellStatusRead,
    HPMailDirectDrawCellStatusReplied,
};

@interface HPMailDirectDrawCell : UITableViewCell

@property (nonatomic, copy) NSString *emial;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *snoppet;
@property (nonatomic, assign) HPMailDirectDrawCellStatus mailStatus;
@property (nonatomic, assign) BOOL hasAttachment;
@property (nonatomic, assign) BOOL isMailSelected;

@end
