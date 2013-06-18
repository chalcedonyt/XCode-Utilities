//
//  PlaceholderWithTextView.m
//  Capsulefy
//
//  Created by Timothy Teoh on 5/24/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import "PlaceholderWithTextView.h"
@interface PlaceholderWithTextView()
@property (nonatomic, strong ) IBOutlet UILabel *placeholderLabel;
@end
@implementation PlaceholderWithTextView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.textView.delegate = (id)self.placeHolderDelegate;
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(textDidChange)
                   name:UITextViewTextDidChangeNotification
                 object:nil];
    }
    return self;
}

- (void)textDidChange
{
    self.placeholderLabel.hidden = ( self.textView.text.length > 0 );
    [self textViewDidChange:self.textView];
}
#pragma textview delegates - pass to delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if( [self.placeHolderDelegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)] ){
        return [self.placeHolderDelegate textView:(UITextView *)textView shouldChangeTextInRange:range replacementText:text];
    }
    return false;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if( [self.placeHolderDelegate respondsToSelector:@selector(textViewDidEndEditing:)] ){
        [self.placeHolderDelegate textViewDidBeginEditing:textView];
    }
        
}
- (void)textViewDidChange:(UITextView *)textView
{
    if( [self.placeHolderDelegate respondsToSelector:@selector(textViewDidChange:)] ){
        [self.placeHolderDelegate textViewDidChange:textView];
    }
}
- (void)textViewDidChangeSelection:(UITextView *)textView
{
    if( [self.placeHolderDelegate respondsToSelector:@selector(textViewDidChangeSelection:)] ){
        [self.placeHolderDelegate textViewDidChangeSelection:textView];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if( [self.placeHolderDelegate respondsToSelector:@selector(textViewDidEndEditing:)] ){
        [self.placeHolderDelegate textViewDidEndEditing:textView];
    }
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if( [self.placeHolderDelegate respondsToSelector:@selector(textViewShouldEndEditing:)] ){
        [self.placeHolderDelegate textViewShouldEndEditing:textView];
    }
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
