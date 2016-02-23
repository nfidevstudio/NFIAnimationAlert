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
}

-(void)viewDidLayoutSubviews {
    NFIAnimationAlert *alert = [[NFIAnimationAlert alloc] initTitleAlertWithSize:CGSizeMake(self.view.frame.size.width, 100)
                                                                           title:@"Proba"
                                                                       viewStyle:NFIAnimationAlertStyleDark
                                                                      enterStyle:NFIEnterAnimationStyleFadeIn
                                                                       exitStyle:NFIExitAnimationStyleFadeOut
                                                                          inView:self.view
                                                                     andShowTime:10.0];
    
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
