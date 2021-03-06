//
//  MyViewController.m
//  Xcode Utilities
//
//  Created by Timothy Teoh on 5/27/13.
//  Copyright (c) 2013 Timothy Teoh. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
@property (nonatomic, strong ) IBOutlet UIView *dummyView;
@property (nonatomic, strong ) IBOutlet UILabel *myLabel;
@property (nonatomic, strong ) PlaceholderWithTextView *placeholderTextView;
@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.dummyView moveFrameUnderView:self.myLabel byMargin:10.0f];
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"PlaceholderWithTextView" owner:self options:nil];
    self.placeholderTextView = [array objectAtIndex:0];
    self.placeholderTextView.placeHolderDelegate = (id)self;
    self.placeholderTextView.frame = self.dummyView.frame;
    [self.view addSubview:self.placeholderTextView];
    [self.dummyView removeFromSuperview];
    
    //example of superfinder
    UIView *v = (UIView *)[self.myLabel findSuperviewOfClass:[UIView class]];
    if( v ){
        NSLog(@"Label has a superview of class %@ at %@", [UIView class], NSStringFromCGRect(v.frame) );
    }
    if ( ![self.myLabel findSuperviewOfClass:[UIScrollView class]] ){
       NSLog(@"Label has no superview of class %@", [UIScrollView class] );
    }
}
- (IBAction)showActionsheet:(id)sender {
    TTActionSheet *actionSheet = [[TTActionSheet alloc] initWithNibNamed:@"TTActionSheet" withTitle:@"What should we do?" withSender:nil];
    actionSheet.actionSheetDelegate = self;
    [actionSheet show];
}
- (IBAction)showAlert:(id)sender {
    TTAlertView *alertView = [[TTAlertView alloc] initWithNibNamed:@"TTAlertView"];
    alertView.alertViewDelegate = (id)self;
    [alertView show];
}
#pragma mark PlaceholderWithTextView delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if( [text isEqualToString:@"\n"] ){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
#pragma mark TTAlertView delegate
- (void)alertView:(TTAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex fromSender:(id)sender
{
    NSLog(@"Alert view button clicked: %d", buttonIndex );
}
- (void)alertViewDidCancel:(TTAlertView *)alertView
{
    NSLog(@"Alert view was cancelled");
}

#pragma mark TTActionSheet delegate
- (void)actionSheet:(TTActionSheet *)view didDismissWithButtonIndex:(NSInteger)buttonIndex fromSender:(id)sender
{
    NSLog(@"Action sheet button clicked: %d", buttonIndex );
}
- (void)actionSheetDidCancel:(TTActionSheet *)actionSheet
{
    NSLog(@"Action sheet was cancelled");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
