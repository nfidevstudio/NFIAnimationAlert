//
//  NFIAnimationAlert.m
//  ExampleAnimationAlert
//
//  Created by José Carlos on 10/2/16.
//  Copyright © 2016 José Carlos. All rights reserved.
//

#import "NFIAnimationAlert.h"

typedef NS_ENUM (NSInteger, NFIAnimationAlertType) {
    NFIAnimationAlertTypeCustom,
    NFIAnimationAlertTypeTitleMessage,
    NFIAnimationAlertTypeTitle
};


typedef NS_ENUM (NSInteger, NFIAnimationType) {
    NFIAnimationTypeEnter,
    NFIAnimationTypeExit
};

#define RGB(r,g,b)[[UIColor alloc] initWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0f]

@interface NFIAnimationAlert ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, assign) CGSize originalSize;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, assign) CGFloat hideTime;
@property (nonatomic, assign) NFIAnimationAlertType alertType;
@property (nonatomic, assign) NFIAnimationAlertStyle style;
@property (nonatomic, assign) NFIEnterAnimationStyle enterStyle;
@property (nonatomic, assign) NFIExitAnimationStyle exitStyle;
@property (nonatomic, assign) BOOL hideTouch;

@end

@implementation NFIAnimationAlert


#pragma mark - Init methods.

- (instancetype)initTitleMessageAlertWithSize:(CGSize)size
                                        title:(NSString *)title
                                      message:(NSString *)message
                                    viewStyle:(NFIAnimationAlertStyle)style
                                   enterStyle:(NFIEnterAnimationStyle)enterStyle
                                    exitStyle:(NFIExitAnimationStyle)exitStyle
                                       inView:(UIView *)containerView
                                  andShowTime:(CGFloat)time {
    return [self initWithFrame:CGRectMake(0, 0, size.width, size.height)
                     alertType:NFIAnimationAlertTypeTitleMessage
                         title:title
                       message:message
                     viewStyle:style
                     enterStyle:enterStyle
                     exitStyle:exitStyle
                        inView:containerView
                   andShowTime:time];
}


- (instancetype)initTitleAlertWithSize:(CGSize)size
                                 title:(NSString *)title
                             viewStyle:(NFIAnimationAlertStyle)style
                            enterStyle:(NFIEnterAnimationStyle)enterStyle
                             exitStyle:(NFIExitAnimationStyle)exitStyle
                                inView:(UIView *)containerView
                           andShowTime:(CGFloat)time {
    return [self initWithFrame:CGRectMake(0, 0, size.width, size.height)
                     alertType:NFIAnimationAlertTypeTitle
                         title:title
                       message:nil
                     viewStyle:style
                    enterStyle:enterStyle
                     exitStyle:exitStyle
                        inView:containerView
                   andShowTime:time];
    
}


- (instancetype)initCustomAlertWithSize:(CGSize)size
                             customView:(UIView *)view
                              viewStyle:(NFIAnimationAlertStyle)style
                             enterStyle:(NFIEnterAnimationStyle)enterStyle
                              exitStyle:(NFIExitAnimationStyle)exitStyle
                                 inView:(UIView *)containerView
                            andShowTime:(CGFloat)time {
    return [self initWithFrame:CGRectMake(0, 0, size.width, size.height)
                     alertType:NFIAnimationAlertTypeCustom
                         title:nil
                       message:nil
                     viewStyle:style
                    enterStyle:enterStyle
                     exitStyle:exitStyle
                        inView:containerView
                   andShowTime:time];
}

- (instancetype)initWithFrame:(CGRect)frame
                    alertType:(NFIAnimationAlertType)alertType
                        title:(NSString *)title
                      message:(NSString *)message
                    viewStyle:(NFIAnimationAlertStyle)style
                   enterStyle:(NFIEnterAnimationStyle)enterStyle
                    exitStyle:(NFIExitAnimationStyle)exitStyle
                       inView:(UIView *)view
                  andShowTime:(CGFloat)time {
    self = [super initWithFrame:frame];
    if (self) {
        _alertType = alertType;
        _style = style;
        _originalSize = frame.size;
        _containerView = view;
        _enterStyle = enterStyle;
        _exitStyle = exitStyle;
        _hideTime = time;
        _hideTouch = YES;
        [self configureView];
        _title.text = title ? title : @"";
        _message.text = message ? message : @"";
    }
    return self;
}


#pragma mark - Public method

- (void)show {
    self.frame = [self fromRect:NFIAnimationTypeEnter];
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

- (void)configureTitleFont:(UIFont *)font {
    _title.font = font;
}

- (void)configureMessageFont:(UIFont *)font {
    _message.font = font;
}

#pragma mark - Private methods

- (void)configureView {
    switch (_alertType) {
        case NFIAnimationAlertTypeCustom:
            [self configureCustomAlert];
            break;
            
        case NFIAnimationAlertTypeTitle:
            [self configureTitleAlert];
            break;
            
        case NFIAnimationAlertTypeTitleMessage:
            [self configureTitleMessageAlert];
            break;
    }
    
    switch (_style) {
        case NFIAnimationAlertStyleCustom:
            break;
            
        case NFIAnimationAlertStyleDark:
            [self configureBackgroundColor:[UIColor darkGrayColor]];
            [self configureTitleColor:[UIColor whiteColor]];
            [self configureMessageColor:[UIColor whiteColor]];
            break;
            
        case NFIAnimationAlertStyleLight:
            [self configureBackgroundColor:[UIColor whiteColor]];
            [self configureTitleColor:[UIColor darkGrayColor]];
            [self configureMessageColor:[UIColor darkGrayColor]];
            break;
            
        case NFIAnimationAlertStyleGreen:
            [self configureBackgroundColor:RGB(102.0,255.0,102.0)];
            [self configureTitleColor:[UIColor whiteColor]];
            [self configureMessageColor:[UIColor whiteColor]];
            break;
        case NFIAnimationAlertStyleRed:
            [self configureBackgroundColor:RGB(255.0,51.0,51.0)];
            [self configureTitleColor:[UIColor whiteColor]];
            [self configureMessageColor:[UIColor whiteColor]];
            break;
        case NFIAnimationAlertStyleBlue:
            [self configureBackgroundColor:RGB(51.0,153.0,255.0)];
            [self configureTitleColor:[UIColor whiteColor]];
            [self configureMessageColor:[UIColor whiteColor]];
            break;
        case NFIAnimationAlertStyleYellow:
            [self configureBackgroundColor:RGB(255.0,255.0,102.0)];
            [self configureTitleColor:[UIColor darkGrayColor]];
            [self configureMessageColor:[UIColor darkGrayColor]];
            break;
    }
}

- (void)configureCustomAlert {
    [self addSubview:_customView];
    NSDictionary *viewBindings = NSDictionaryOfVariableBindings(@"customView",_customView);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%f-[_customView]-%f-|",0.f, 0.f] options:0 metrics:nil views:viewBindings]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%f-[_customView]-%f-|",0.f, 0.f] options:0 metrics:nil views:viewBindings]];
    [self layoutIfNeeded];
    [self updateConstraints];
}

- (void)configureTitleMessageAlert {
    _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width, self.frame.size.height / 2)];
    _message = [[UILabel alloc] initWithFrame:CGRectMake(10, self.frame.size.height / 2, self.frame.size.width, self.frame.size.height / 2)];
    _title.font = [UIFont boldSystemFontOfSize:15.0];
    _message.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:_title];
    [self addSubview:_message];
}

- (void)configureTitleAlert {
    _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 10, self.frame.size.height)];
    _title.font = [UIFont boldSystemFontOfSize:15.0];
    [self addSubview:_title];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [self hide:nil];
}

-(void)hide:(NSTimer *)timer {
    [UIView animateWithDuration:1.0 animations:^{
        self.frame = [self fromRect:NFIAnimationTypeExit];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (CGRect)fromRect:(NFIAnimationType)animation {
    if (animation == NFIAnimationTypeEnter) {
        switch (_enterStyle) {
            case NFIEnterAnimationStyleFromBottomToLeft:
                return CGRectMake(+_originalSize.width, _containerView.frame.size.height - _originalSize.height, _originalSize.width, _originalSize.height);
                
            case NFIEnterAnimationStyleFromBottomToRight:
                return CGRectMake(-_originalSize.width,_containerView.frame.size.height - _originalSize.height, _originalSize.width, _originalSize.height);
                
            case NFIEnterAnimationStyleFromBottomToTop:
                return CGRectMake(0,_containerView.frame.size.height + _originalSize.height, _originalSize.width, _originalSize.height);
                
            case NFIEnterAnimationStyleFromTopToBottom:
                return CGRectMake(0,- _originalSize.height, _originalSize.width, _originalSize.height);
                
            case NFIEnterAnimationStyleFromTopToLeft:
                return CGRectMake(+_originalSize.width,0, _originalSize.width, _originalSize.height);
                
            case NFIEnterAnimationStyleFromTopToRight:
                return CGRectMake(-_originalSize.width, 0, _originalSize.width, _originalSize.height);
        }
    } else {
        switch (_exitStyle) {
            case NFIExitAnimationStyleToRight:
                return CGRectMake(_containerView.frame.size.width + _originalSize.width,self.frame.origin.y, _originalSize.width, _originalSize.height);
                
            case NFIExitAnimationStyleToBottom:
                return CGRectMake(0,_containerView.frame.size.height + _originalSize.height, _originalSize.width, _originalSize.height);
                
            case NFIExitAnimationStyleToLeft:
                return CGRectMake(-_originalSize.width, self.frame.origin.y, _originalSize.width, _originalSize.height);
                
            case NFIExitAnimationStyleToTop:
                return CGRectMake(0,-_originalSize.height, _originalSize.width, _originalSize.height);
        }
    }
    return CGRectZero;
}

- (CGRect)toRect {
    switch (_enterStyle) {
        case NFIEnterAnimationStyleFromBottomToLeft:
        case NFIEnterAnimationStyleFromBottomToRight:
        case NFIEnterAnimationStyleFromBottomToTop:
            return CGRectMake(0,_containerView.frame.size.height - _originalSize.height, _originalSize.width, _originalSize.height);
            
        case NFIEnterAnimationStyleFromTopToBottom:
        case NFIEnterAnimationStyleFromTopToLeft:
        case NFIEnterAnimationStyleFromTopToRight:
            return CGRectMake(0,0, _originalSize.width, _originalSize.height);
    }
    return CGRectZero;
}

@end
