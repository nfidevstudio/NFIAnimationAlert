# NFIAnimationAlert - v 0.1

### Show custom pretty alerts

![](https://github.com/nfiframeworks/NFIAnimationAlert/blob/master/ExampleAnimationAlert/Screenshots/screenshot_1.png?raw=true)
![](https://github.com/nfiframeworks/NFIAnimationAlert/blob/master/ExampleAnimationAlert/Screenshots/screenshot_2.png?raw=true)

First, import:

```Objective-c
#import "NFIAnimationAlert.h"
```

Then, simply create the alert:

```Objective-c
NFIAnimationAlert *alert = [[NFIAnimationAlert alloc] initTitleMessageAlertWithSize:CGSizeMake(self.view.frame.size.width, 80)
                                                                                  title:@"Example Title"
                                                                                message:@"This is a example of a message"
                                                                              viewStyle:NFIAnimationAlertStyleBlue
                                                                             enterStyle:NFIEnterAnimationStyleFromBottomToTop
                                                                              exitStyle:NFIExitAnimationStyleToRight
                                                                                 inView:self.view
                                                                            andShowTime:1.0];
```

And show it:

```Objective-c
[alert show];
```

