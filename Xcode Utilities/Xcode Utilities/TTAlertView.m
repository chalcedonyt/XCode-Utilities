//
//  TTAlertView.m
//  WhoLikes
//
//  Created by Timothy Teoh on 6/12/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import "TTAlertView.h"
@interface TTAlertView()
@property (nonatomic, strong ) IBOutletCollection(UIButton)NSArray *buttons;
@property (nonatomic, strong ) IBOutlet UIButton *cancelButton;
@property (nonatomic) id sender;
@end

@implementation TTAlertView

int _TTAlertViewOverlayTag = 42;

- (id)initWithNibNamed:(NSString *)nibName
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    self = [array objectAtIndex:0];
    self.buttons = [self.buttons sortByUIViewOriginY];
    return self;
}
- (void)buttonClicked:(UIButton *)sender
{
    int buttonIndex = [self.buttons indexOfObject:sender];
    if( sender == self.cancelButton ){
        if( [self.alertViewDelegate respondsToSelector:@selector(alertViewDidCancel:)]){
            [self.alertViewDelegate alertViewDidCancel:self];
        }
    }
    if( [self.alertViewDelegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:fromSender:)]){
        [self.alertViewDelegate alertView:self didDismissWithButtonIndex:buttonIndex fromSender:self.sender];
    }
    [[[[UIApplication sharedApplication] keyWindow] viewWithTag:_TTAlertViewOverlayTag] removeFromSuperview];
    [UIView animateWithDuration:0.2 animations:^(void){
        self.transform=CGAffineTransformMakeScale(0.1,0.1);
    } completion:^(BOOL success){
        [self removeFromSuperview];
    }];
}
- (void)show
{
    [self showOverlay];
    
    
    for( int i = 0 ; i < [self.buttons count]; i++ ){
        UIButton *button = [self.buttons objectAtIndex:i];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    self.center = [[UIApplication sharedApplication] keyWindow].center;
    self.transform=CGAffineTransformMakeScale(0.5, 0.5);
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:(void (^)(void)) ^{
                         self.transform=CGAffineTransformMakeScale(1.2,1.2);
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.05 animations:(void (^)(void)) ^{
                             self.transform=CGAffineTransformMakeScale(1,1);
                         }];
                     }];



}
- (void)showOverlay
{
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    view.userInteractionEnabled = YES;
    view.tag = _TTAlertViewOverlayTag;
    [[[UIApplication sharedApplication] keyWindow] addSubview:view];
    [UIView animateWithDuration:0.2 animations:^(void){
        view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    }];
}
@end
