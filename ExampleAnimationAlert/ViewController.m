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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NFIAnimationAlert *alert = [[NFIAnimationAlert alloc] initTitleMessageAlertWithSize:CGSizeMake(self.view.frame.size.width, 80)
                                                                                  title:@"Example Title"
                                                                                message:@"This is a example of a message"
                                                                              viewStyle:NFIAnimationAlertStyleBlue
                                                                             enterStyle:NFIEnterAnimationStyleFromBottomToTop
                                                                              exitStyle:NFIExitAnimationStyleToRight
                                                                                 inView:self.view
                                                                            andShowTime:1.0];
    [alert show];
}

-(void)viewDidLayoutSubviews {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
