//
//  MyViewController.h
//  Xcode Utilities
//
//  Created by Timothy Teoh on 5/27/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Positioning.h"
#import "PlaceholderWithTextView.h"
#import "TTActionSheet.h"
#import "TTAlertView.h"
#import "UIView+SuperFinder.h"
@interface MyViewController : UIViewController <TTActionSheetDelegate,TTAlertViewDelegate,PlaceholderWithTextViewDelegate>

@end
