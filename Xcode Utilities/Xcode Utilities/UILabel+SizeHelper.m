//
//  UILabel+SizeHelper.m
//  churpchurp
//
//  Created by Timothy Teoh on 4/4/12.
//  Copyright (c) 2012 Netccentric Sdn Bhd. All rights reserved.
//

#import "UILabel+SizeHelper.h"

@implementation UILabel( SizeHelper)

- (void)sizeToFitFixedWidth:(CGFloat)fixedWidth
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, fixedWidth, 0);
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.numberOfLines = 0;
    NSTextAlignment alignment = self.textAlignment;
    [self sizeToFit];
    self.textAlignment = alignment;
}

@end
