//
//  UIView+UIView_MoveFrameUnderView.m
//  Capsulefy
//
//  Created by Timothy Teoh on 5/25/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import "UIView+MoveFrameUnderView.h"

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
@end
