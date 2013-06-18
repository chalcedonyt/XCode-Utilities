//
//  TTActionSheet.m
//  Capsulefy
//
//  Created by Timothy Teoh on 6/3/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import "TTActionSheet.h"
@interface TTActionSheet()
@property (nonatomic, strong ) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong ) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, strong ) IBOutlet UIButton *cancelButton;
@property (nonatomic ) id sender;
@end
@implementation TTActionSheet

int _TTActionSheetOverlayTag = 42;


- (id)initWithNibNamed:(NSString *)nibName withTitle:(NSString *)title withSender:(id)sender
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    self = [array objectAtIndex:0];
    self.sender = sender;
    [self showOverlay];
    self.titleLabel.text = title;
    [self.titleLabel sizeToFitFixedWidth:280.0f];
    
    self.buttons = [self.buttons sortByUIViewOriginY];
    for( int i = 0 ; i < [self.buttons count]; i++ ){
        
        UIButton *button = [self.buttons objectAtIndex:i];
        /* taking out auto-positioning feature
        if( i == 0 ){
            [button moveFrameUnderView:self.titleLabel byMargin:20.0f];
        } else{
            [button moveFrameUnderView:[self.buttons objectAtIndex:(i-1) ] byMargin:10.0f];
        }*/
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    

    return self;
}
- (void)show
{
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [self moveFrameUnderView:[[UIApplication sharedApplication] keyWindow] byMargin:0];
    [UIView animateWithDuration:0.2 animations:^(void){
        [self moveFrameUnderView:[[UIApplication sharedApplication] keyWindow] byMargin:-(self.frame.size.height)];
    }];
}
- (void)buttonClicked:(UIButton *)sender
{
    int buttonIndex = [self.buttons indexOfObject:sender];
    if( sender == self.cancelButton ){
        if( [self.actionSheetDelegate respondsToSelector:@selector(actionSheetDidCancel:)]){
            [self.actionSheetDelegate actionSheetDidCancel:self];
        }    
    }
    if( [self.actionSheetDelegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:fromSender:)]){
            [self.actionSheetDelegate actionSheet:self didDismissWithButtonIndex:buttonIndex fromSender:self.sender];
    }
    [[[[UIApplication sharedApplication] keyWindow] viewWithTag:_TTActionSheetOverlayTag] removeFromSuperview];
    [UIView animateWithDuration:0.2 animations:^(void){
        [self moveFrameUnderView:[[UIApplication sharedApplication] keyWindow] byMargin:0];
    } completion:^(BOOL success){
        [self removeFromSuperview];
    }];
}
- (void)showOverlay
{
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    view.userInteractionEnabled = YES;
    view.tag = _TTActionSheetOverlayTag;
    [[[UIApplication sharedApplication] keyWindow] addSubview:view];
    [UIView animateWithDuration:0.2 animations:^(void){
        view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }];
}
@end
