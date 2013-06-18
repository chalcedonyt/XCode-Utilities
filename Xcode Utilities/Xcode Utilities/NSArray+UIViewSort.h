//
//  NSArray+UIViewSort.h
//  Capsulefy
//
//  Created by Timothy Teoh on 6/3/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (UIViewSort)
- (NSArray*) sortByObjectTag;
- (NSArray*) sortByUIViewOriginX;
- (NSArray*) sortByUIViewOriginY;
@end
