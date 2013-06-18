//
//  UIView+SuperFinder.m
//  churpchurp
//
//  Created by Timothy Teoh on 4/6/12.
//  Copyright (c) 2012 Netccentric Sdn Bhd. All rights reserved.
//

#import "UIView+SuperFinder.h"

@implementation UIView(SuperFinder)

- (UIView *)findSuperviewOfClass:(Class )superClass
{
    UIView *sView = self.superview;
   // NSLog(@"Comparing %@", [self.superview class]);
    if( sView && ![sView isKindOfClass:superClass])
        return [sView findSuperviewOfClass:superClass];
    else if( sView && [sView isKindOfClass:superClass] ){
        return sView;
    }
    else return nil;
}

@end
