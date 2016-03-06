//
//  NFIAnimationAlert.h
//  ExampleAnimationAlert
//
//  Created by José Carlos on 10/2/16.
//  Copyright © 2016 José Carlos. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, NFIAnimationAlertStyle) {
    NFIAnimationAlertStyleCustom,
    NFIAnimationAlertStyleDark,
    NFIAnimationAlertStyleLight,
    NFIAnimationAlertStyleRed,
    NFIAnimationAlertStyleBlue,
    NFIAnimationAlertStyleGreen,
    NFIAnimationAlertStyleYellow
};

typedef NS_ENUM (NSInteger, NFIEnterAnimationStyle) {
    NFIEnterAnimationStyleFromBottomToTop,
    NFIEnterAnimationStyleFromTopToBottom,
    NFIEnterAnimationStyleFromBottomToRight,
    NFIEnterAnimationStyleFromBottomToLeft,
    NFIEnterAnimationStyleFromTopToRight,
    NFIEnterAnimationStyleFromTopToLeft
};

typedef NS_ENUM (NSInteger, NFIExitAnimationStyle) {
    NFIExitAnimationStyleToTop,
    NFIExitAnimationStyleToBottom,
    NFIExitAnimationStyleToRight,
    NFIExitAnimationStyleToLeft
};

@interface NFIAnimationAlert : UIView

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
                                    viewStyle:(NFIAnimationAlertStyle)style
                                    enterStyle:(NFIEnterAnimationStyle)enterStyle
                                    exitStyle:(NFIExitAnimationStyle)exitStyle
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
                             viewStyle:(NFIAnimationAlertStyle)style
                            enterStyle:(NFIEnterAnimationStyle)enterStyle
                             exitStyle:(NFIExitAnimationStyle)exitStyle
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
- (instancetype)initLoadingAlertWithSize:(CGSize)size
                                 title:(NSString *)title
                             viewStyle:(NFIAnimationAlertStyle)style
                            enterStyle:(NFIEnterAnimationStyle)enterStyle
                             exitStyle:(NFIExitAnimationStyle)exitStyle
                                inView:(UIView *)view
                           andShowTime:(CGFloat)time;


#pragma mark - Public method

/**
 *  Show the alert
 */
- (void)show;

/**
 * Hide the alert with exit animation
 */
- (void)hide;

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
 *  Configure the loading indicator color.
 */
- (void)configureLoadingIndicatorColor:(UIColor *)color;

/**
 *  Configure the title font.
 */
- (void)configureTitleFont:(UIFont *)font;

/**
 *  Configure the message font.
 */
- (void)configureMessageFont:(UIFont *)font;

/**
 *  Set to NO if you dont want to hide the view if touch inside of it
 */
- (void)touchToHideEnabled:(BOOL)enabled;

@end
