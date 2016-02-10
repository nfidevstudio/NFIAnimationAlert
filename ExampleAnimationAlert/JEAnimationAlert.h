//
//  JEAnimationAlert.h
//  ExampleAnimationAlert
//
//  Created by José Carlos on 10/2/16.
//  Copyright © 2016 José Carlos. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, JEAnimationAlertStyle) {
    JEAnimationAlertStyleCustom,
    JEAnimationAlertStyleDark,
    JEAnimationAlertStyleLight
};

typedef NS_ENUM (NSInteger, JEAnimationAlertAnimationStyle) {
    JEAnimationAlertAnimationStyleFromBottomToTop,
    JEAnimationAlertAnimationStyleFromTopToBottom,
    JEAnimationAlertAnimationStyleFromBottomToRight,
    JEAnimationAlertAnimationStyleFromBottomToLeft,
    JEAnimationAlertAnimationStyleFromTopToRight,
    JEAnimationAlertAnimationStyleFromTopToLeft
};

@interface JEAnimationAlert : UIView

#pragma mark - Init AnimationAlert

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
- (instancetype)initTitleMessageAlertWithSize:(CGSize)size
                                        title:(NSString *)title
                                      message:(NSString *)message
                                    viewStyle:(JEAnimationAlertStyle)style
                                    showStyle:(JEAnimationAlertAnimationStyle)showStyle
                                       inView:(UIView *)view
                                  andShowTime:(CGFloat)time;

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
- (instancetype)initTitleAlertWithSize:(CGSize)size
                                 title:(NSString *)title
                             viewStyle:(JEAnimationAlertStyle)style
                             showStyle:(JEAnimationAlertAnimationStyle)showStyle
                                       inView:(UIView *)view
                                  andShowTime:(CGFloat)time;

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
- (instancetype)initCustomAlertWithSize:(CGSize)size
                             customView:(UIView *)view
                              viewStyle:(JEAnimationAlertStyle)style
                              showStyle:(JEAnimationAlertAnimationStyle)showStyle
                                inView:(UIView *)view
                           andShowTime:(CGFloat)time;


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
 *  Configure the title color.
 */
- (void)configureTitleColor:(UIColor *)color;

/**
 *  Configure the message color.
 */
- (void)configureMessageColor:(UIColor *)color;

/**
 *  Set to NO if you dont want to hide the view if touch inside of it
 */
- (void)touchToHideEnabled:(BOOL)enabled;


@end
