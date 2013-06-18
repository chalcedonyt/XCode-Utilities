//
//  TTAlertView.h
//  WhoLikes
//
//  Created by Timothy Teoh on 6/12/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+UIViewSort.h"
#import "UIView+Positioning.h"
@class TTAlertView;

@protocol TTAlertViewDelegate <NSObject>
@optional
- (void)alertView:(TTAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex fromSender:(id)sender;
- (void)alertViewDidCancel:(TTAlertView *)alertView;
@end
@interface TTAlertView : UIView
- (id)initWithNibNamed:(NSString *)nibName;
- (void) show;
@property (nonatomic) id <TTAlertViewDelegate> alertViewDelegate;
@end
