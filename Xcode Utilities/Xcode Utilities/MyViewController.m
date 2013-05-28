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
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
