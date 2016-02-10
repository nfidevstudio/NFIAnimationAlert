//
//  GMAlert.h
//  ProximityMarketingDemo
//
//  Created by José Carlos on 16/12/15.
//  Copyright © 2015 Geomobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, GMAlertShowStyle) {
    GMAlertShowStyleFromBottom,
    GMAlertShowStyleFromTop,
    GMAlertShowStyleFromRight,
    GMAlertShowStyleFromLeft
};

@interface GMAlert : UIView

#pragma mark - Viewlife cicle

/**
 *  Init the Alert view. This method not show the alert, call [alert show] once initialized
 *
 *  @param title
 *  @param message
 *  @param showStyle
 *  @param hideTime
 *  @param view
 *
 *  @return
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message showStyle:(GMAlertShowStyle)showStyle hideIn:(NSInteger)hideTime inView:(UIView *)view;

#pragma mark - Public method

/**
 *  Show the alert
 */
- (void)show;

/**
 *  Configure the background color
 */
- (void)configureBackgroundColor:(UIColor *)color;

/**
 *  Configure the title color
 */
- (void)configureTitleColor:(UIColor *)color;

/**
 *  Configure the message color
 */
- (void)configureMessageColor:(UIColor *)color;

/**
 *  Set to NO if you dont want to hide the view if touch inside of it
 */
- (void)touchToHideEnabled:(BOOL)enabled;

@end
