//
//  UIView+UIView_MoveFrameUnderView.m
//  Capsulefy
//
//  Created by Timothy Teoh on 5/25/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import "UIView+Positioning.h"

@implementation UIView (UIView_MoveFrameUnderView)

- (void)moveFrameToPoint:(CGPoint )point
{
    CGRect selfFrame = self.frame;

    [self setFrame:CGRectMake(point.x, point.y, selfFrame.size.width, selfFrame.size.height)];
    
}
- (void)moveFrameUnderView:(UIView *)view byMargin:(float)margin
{
    [self moveFrameToPoint:CGPointMake(self.frame.origin.x,view.frame.origin.y + view.frame.size.height + margin)];
}
- (void)replaceWithView:(UIView *)view
{
    CGRect selfFrame = self.frame;
    view.frame = selfFrame;
    [self.superview addSubview:view];
    [self removeFromSuperview];
}
- (void)placeAtViewFrame:(UIView *)view
{
    CGRect viewFrame = view.frame;
    self.frame = viewFrame;
    [view.superview addSubview:self];
}
@end
