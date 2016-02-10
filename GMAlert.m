//
//  GMAlert.m
//  ProximityMarketingDemo
//
//  Created by José Carlos on 16/12/15.
//  Copyright © 2015 Geomobile. All rights reserved.
//

#import "GMAlert.h"

@interface GMAlert ()

@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *message;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) NSInteger hideTime;
@property (nonatomic, assign) GMAlertShowStyle showStyle;
@property (nonatomic, assign) BOOL hideTouch;

@end

@implementation GMAlert

#pragma mark - Viewlife cicle

- (id)initWithTitle:(NSString *)title message:(NSString *)message showStyle:(GMAlertShowStyle)showStyle hideIn:(NSInteger)hideTime inView:(UIView *)view {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self = [[[NSBundle mainBundle]
                 loadNibNamed:@"GMAlert"
                 owner:self options:nil]
                firstObject];
        _view = view;
        _title.text = title;
        _message.text = message;
        _showStyle = showStyle;
        _hideTime = hideTime;
        _hideTouch = YES;
    }
    return self;
}

#pragma mark - Public method

- (void)show {
    self.frame = [self fromRect];
    [_view addSubview:self];
    
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
    switch (_showStyle) {
        case GMAlertShowStyleFromBottom:
            return CGRectMake(0,_view.frame.size.height + _view.frame.size.height/6, _view.frame.size.width, _view.frame.size.height/6);
            
        case GMAlertShowStyleFromTop:
            return CGRectMake(0,-(_view.frame.size.height/6), _view.frame.size.width, _view.frame.size.height/6);
            
        case GMAlertShowStyleFromLeft:
            return CGRectMake(-_view.frame.size.width, (_view.frame.size.height/6) * 5, _view.frame.size.width, _view.frame.size.height/6);
            
        case GMAlertShowStyleFromRight:
            return CGRectMake(_view.frame.size.width * 2, (_view.frame.size.height/6) * 5, _view.frame.size.width, _view.frame.size.height/6);
    }
}

- (CGRect)toRect {
    switch (_showStyle) {
        case GMAlertShowStyleFromTop:
            return CGRectMake(0, 0, _view.frame.size.width, _view.frame.size.height/6);
        default:
            return CGRectMake(0, (_view.frame.size.height/6) * 5, _view.frame.size.width, _view.frame.size.height/6);
    }
}

@end
