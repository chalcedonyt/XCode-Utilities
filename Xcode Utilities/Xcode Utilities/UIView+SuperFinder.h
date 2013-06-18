//
//  UIView+SuperFinder.h
//  churpchurp
//
//  Created by Timothy Teoh on 4/6/12.
//  Copyright (c) 2012 Netccentric Sdn Bhd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView( SuperFinder )
- (UIView *)findSuperviewOfClass:(Class )superClass;
@end