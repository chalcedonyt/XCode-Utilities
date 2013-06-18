//
//  TTActionSheet.h
//  Capsulefy
//
//  Created by Timothy Teoh on 6/3/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Positioning.h"
#import "UILabel+SizeHelper.h"
#import "NSArray+UIViewSort.h"

@class TTActionSheet;

@protocol TTActionSheetDelegate <NSObject>
@optional
- (void)actionSheetDidCancel:(TTActionSheet *)actionSheet;
- (void)actionSheet:(TTActionSheet *)view didDismissWithButtonIndex:(NSInteger)buttonIndex fromSender:(id)sender;
@end

@interface TTActionSheet : UIView
- (id)initWithNibNamed:(NSString *)nibName withTitle:(NSString *)title withSender:(id)sender;
- (void) show;
@property (nonatomic) id <TTActionSheetDelegate> actionSheetDelegate;

@end
