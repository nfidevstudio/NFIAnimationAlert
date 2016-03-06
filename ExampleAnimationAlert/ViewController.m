//
//  ViewController.m
//  ExampleAnimationAlert
//
//  Created by José Carlos on 10/2/16.
//  Copyright © 2016 José Carlos. All rights reserved.
//

#import "ViewController.h"
#import "NFIAnimationAlert.h"

@interface ViewController ()

@property (nonatomic, strong) NFIAnimationAlert *alert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _alert = [[NFIAnimationAlert alloc] initLoadingAlertWithSize:CGSizeMake(self.view.frame.size.width, 80)
                                                                                  title:@"Example Title"
                                                                              viewStyle:NFIAnimationAlertStyleBlue
                                                                             enterStyle:NFIEnterAnimationStyleFromBottomToTop
                                                                              exitStyle:NFIExitAnimationStyleToRight
                                                                                 inView:self.view
                                                                            andShowTime:0];
    [_alert show];
    
    
    NSTimer * timer = [[NSTimer alloc]initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:5]
                                              interval:0.0f target:self selector:@selector(hide:)
                                              userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)hide:(NSTimer *)timer {
    [_alert hide];
}

-(void)viewDidLayoutSubviews {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
