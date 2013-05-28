//
//  PlaceholderWithTextView.h
//  Capsulefy
//
//  Created by Timothy Teoh on 5/24/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlaceholderWithTextViewDelegate <NSObject>

@optional
- (void)textViewDidBeginEditing:(UITextView *)textView;
- (void)textViewDidChange:(UITextView *)textView;
- (void)textViewDidChangeSelection:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;

@end
@interface PlaceholderWithTextView : UIView <UITextViewDelegate>
@property (nonatomic, strong ) IBOutlet UITextView *textView;
@property (nonatomic) id <PlaceholderWithTextViewDelegate> placeHolderDelegate;
@end
