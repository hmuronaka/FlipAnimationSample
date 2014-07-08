//
//  ViewController.m
//  FlipAnimationSample
//
//  Created by MURONAKA HIROAKI on 2014/07/08.
//  Copyright (c) 2014年 hmu. All rights reserved.
//

#import "ViewController.h"
#import "FlipAnimation.h"

@interface ViewController ()

@property(nonatomic, strong) UILabel* frontLabel;
@property(nonatomic, strong) UILabel* backLabel;
@property(nonatomic, strong) FlipAnimation* flipAnimator;
@property(nonatomic, assign) BOOL isFront;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.isFront = YES;
    
    CGRect frame = CGRectMake(100, 100, 100, 100);
    self.frontLabel = [[UILabel alloc] initWithFrame:frame];
    [self.frontLabel setTextAlignment:NSTextAlignmentCenter];
    [self.frontLabel setText:@"FRONT"];
    [self.frontLabel setBackgroundColor:[UIColor blueColor]];
    
    self.backLabel = [[UILabel alloc] initWithFrame:frame];
    [self.backLabel setTextAlignment:NSTextAlignmentCenter];
    [self.backLabel setText:@"BACK"];
    [self.backLabel setBackgroundColor:[UIColor yellowColor]];
    
   
    UIButton* flipButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    [flipButton setBackgroundColor:[UIColor redColor]];
    [flipButton setTitle:@"Flip" forState:UIControlStateNormal];
    [flipButton addTarget:self action:@selector(pressedFlip:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.backLabel];
    [self.view addSubview:self.frontLabel];
    [self.view addSubview:flipButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pressedFlip:(id)sender {
    UIView* fromView;
    UIView* toView;
    if( self.isFront) {
        self.isFront = !self.isFront;
        fromView = self.frontLabel;
        toView = self.backLabel;
    } else {
        self.isFront = !self.isFront;
        fromView = self.backLabel;
        toView = self.frontLabel;
    }
    self.flipAnimator = [[FlipAnimation alloc] initWithDuration:1.0 fromView:fromView toView:toView];
    // 裏になったビューを削除する場合はYESにする
    self.flipAnimator.isRemoveFromViewAfterFlipped = NO;
    [self.flipAnimator startAnimation];
}

@end
