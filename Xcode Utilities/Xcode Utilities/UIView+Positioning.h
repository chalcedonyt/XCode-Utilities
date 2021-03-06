//
//  UIView+UIView_MoveFrameUnderView.h
//  Capsulefy
//
//  Created by Timothy Teoh on 5/25/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_Positioning)
- (void)moveFrameToPoint:(CGPoint )point;
- (void)moveFrameUnderView:(UIView *)view byMargin:(float)margin;
- (void)replaceWithView:(UIView *)view;
- (void)placeAtViewFrame:(UIView *)view;
@end
