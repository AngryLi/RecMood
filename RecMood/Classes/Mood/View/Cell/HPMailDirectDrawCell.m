//
//  HPMailDirectDrawCell.m
//  RecMood
//
//  Created by 李亚洲 on 2017/5/21.
//  Copyright © 2017年 李亚洲. All rights reserved.
//

#import "HPMailDirectDrawCell.h"

@implementation HPMailDirectDrawCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    {
        UIImage *statusImage= nil;
        switch (self.mailStatus) {
            case HPMailDirectDrawCellStatusRead:
                statusImage = nil;
                break;
            case HPMailDirectDrawCellStatusUnread:
                statusImage = nil;
                break;
            case HPMailDirectDrawCellStatusReplied:
                statusImage = nil;
                break;
                
            default:
                break;
        }
        CGRect statusRect = CGRectMake(8, 4, 12, 12);
        [statusImage drawInRect:statusRect];
    }
    
    {
        UIImage *attachmentImage = nil;
        if (self.hasAttachment) {
            attachmentImage = nil;
            CGRect attachmentRect = CGRectMake(8, 20, 12, 12);
            [attachmentImage drawInRect:attachmentRect];
        }
    }
    
    {
        UIImage *selectedImage = [UIImage imageNamed:(self.isMailSelected ? @"mail_selected" : @"mail_unselected")];
        [selectedImage drawInRect:CGRectMake(8, 36, 12, 12)];
    }
    
    CGFloat fontSize = 13;
    CGFloat width = rect.size.width;
    CGFloat remainderWidth = width - 28;
    {
        CGFloat emailWidth = remainderWidth - 72;
        UIFont *emailFont = [UIFont boldSystemFontOfSize:fontSize];
        NSDictionary *attrs = @{ NSFontAttributeName:emailFont};
        
        [self.emial drawInRect:CGRectMake(28, 4, emailWidth, 16) withAttributes:attrs];
    }
    
    {
        UIFont *stdFont = [UIFont systemFontOfSize:fontSize];
        NSDictionary *attrs = @{ NSFontAttributeName : stdFont };
        [self.subject drawInRect:CGRectMake(28, 24, remainderWidth, 16) withAttributes:attrs];
        [self.snoppet drawInRect:CGRectMake(28, 44, remainderWidth, 16) withAttributes:attrs];
    }
    
    {
        UIFont *verdana = [UIFont fontWithName:@"Verdana" size:10];
        NSDictionary *attrs = @{NSFontAttributeName:verdana};
        [self.date drawInRect:CGRectMake(width - 60, 4, 60, 16) withAttributes:attrs];
    }
}

@end
