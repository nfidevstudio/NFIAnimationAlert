//
//  JEAnimationAlert.m
//  ExampleAnimationAlert
//
//  Created by José Carlos on 10/2/16.
//  Copyright © 2016 José Carlos. All rights reserved.
//

#import "JEAnimationAlert.h"

typedef NS_ENUM (NSInteger, JEAnimationAlertType) {
    JEAnimationAlertTypeCustom,
    JEAnimationAlertTypeTitleMessage,
    JEAnimationAlertTypeTitle
};

@interface JEAnimationAlert ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, assign) CGSize originalSize;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, assign) CGFloat hideTime;
@property (nonatomic, assign) JEAnimationAlertAnimationStyle showStyle;
@property (nonatomic, assign) BOOL hideTouch;

@end

@implementation JEAnimationAlert


#pragma mark - Init methods.

- (instancetype)initTitleMessageAlertWithSize:(CGSize)size
                                        title:(NSString *)title
                                      message:(NSString *)message
                                    viewStyle:(JEAnimationAlertStyle)style
                                    showStyle:(JEAnimationAlertAnimationStyle)showStyle
                                       inView:(UIView *)containerView
                                  andShowTime:(CGFloat)time {
    return [self initWithFrame:CGRectZero
                     alertType:JEAnimationAlertTypeTitleMessage
                         title:title
                       message:message
                     viewStyle:style
                     showStyle:showStyle
                        inView:containerView
                   andShowTime:time];
}


- (instancetype)initTitleAlertWithSize:(CGSize)size
                                 title:(NSString *)title
                             viewStyle:(JEAnimationAlertStyle)style
                             showStyle:(JEAnimationAlertAnimationStyle)showStyle
                                inView:(UIView *)containerView
                           andShowTime:(CGFloat)time {
    return [self initWithFrame:CGRectZero
                     alertType:JEAnimationAlertTypeTitle
                         title:title
                       message:nil
                     viewStyle:style
                     showStyle:showStyle
                        inView:containerView
                   andShowTime:time];
    
}


- (instancetype)initCustomAlertWithSize:(CGSize)size
                             customView:(UIView *)view
                              viewStyle:(JEAnimationAlertStyle)style
                              showStyle:(JEAnimationAlertAnimationStyle)showStyle
                                 inView:(UIView *)containerView
                            andShowTime:(CGFloat)time {
    return [self initWithFrame:CGRectZero
                     alertType:JEAnimationAlertTypeCustom
                         title:nil
                       message:nil
                     viewStyle:style
                     showStyle:showStyle
                        inView:containerView
                   andShowTime:time];
}

- (instancetype)initWithFrame:(CGRect)frame
                    alertType:(JEAnimationAlertType)alertType
                        title:(NSString *)title
                      message:(NSString *)message
                    viewStyle:(JEAnimationAlertStyle)style
                    showStyle:(JEAnimationAlertAnimationStyle)showStyle
                       inView:(UIView *)view
                  andShowTime:(CGFloat)time {
    self = [super initWithFrame:frame];
    if (self) {
        _containerView = view;
        _title.text = title;
        _message.text = message;
        _showStyle = showStyle;
        _hideTime = time;
        _hideTouch = YES;
    }
    return self;
}

#pragma mark - Public method

- (void)show {
    self.frame = [self fromRect];
    [_containerView addSubview:self];
    
    if (_hideTouch) {
        UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self addGestureRecognizer:singleFingerTap];
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        self.frame = [self toRect];
    } completion:^(BOOL finished) {
        NSTimer * timer = [[NSTimer alloc]initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:_hideTime]
                                                  interval:0.0f target:self selector:@selector(hide:)
                                                  userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    }];
}

- (void)configureBackgroundColor:(UIColor *)color {
    self.backgroundColor = color;
}

- (void)configureTitleColor:(UIColor *)color {
    _title.textColor = color;
}

- (void)configureMessageColor:(UIColor *)color {
    _message.textColor = color;
}

- (void)touchToHideEnabled:(BOOL)enabled {
    _hideTouch = enabled;
}

#pragma mark - Private methods

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [self hide:nil];
}

-(void)hide:(NSTimer *)timer {
    [UIView animateWithDuration:1.0 animations:^{
        self.frame = [self fromRect];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (CGRect)fromRect {
//    switch (_showStyle) {
//        case JEAnimationAlertFromBottomToTop:
//            return CGRectMake(0,_view.frame.size.height + _view.frame.size.height/6, _view.frame.size.width, _view.frame.size.height/6);
//            
//        case JEAnimationAlertFromTopToBottom:
//            return CGRectMake(0,-(_view.frame.size.height/6), _view.frame.size.width, _view.frame.size.height/6);
//            
//        case JEAnimationAlertFromBottomToLeft:
//            return CGRectMake(-_view.frame.size.width, (_view.frame.size.height/6) * 5, _view.frame.size.width, _view.frame.size.height/6);
//            
//        case JEAnimationAlertFromBottomToRight:
//            return CGRectMake(_view.frame.size.width * 2, (_view.frame.size.height/6) * 5, _view.frame.size.width, _view.frame.size.height/6);
//    }
    return CGRectZero;
}

- (CGRect)toRect {
//    switch (_showStyle) {
//        case JEAnimationAlertFromTopToBottom:
//            return CGRectMake(0, 0, _view.frame.size.width, _view.frame.size.height/6);
//        default:
//            return CGRectMake(0, (_view.frame.size.height/6) * 5, _view.frame.size.width, _view.frame.size.height/6);
//    }
    return CGRectZero;
}

@end
