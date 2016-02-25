//
//  CameraAlertView.m
//  PGFH
//
//  Created by mansoor shaikh on 11/03/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "CameraAlertView.h"
#import "UIColor+Expanded.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <QuartzCore/QuartzCore.h>
@implementation CameraAlertView
@synthesize appDelegate,popover,demoView,cancel;

- (id)init
{
    self = [super init];
    appDelegate=[[UIApplication sharedApplication] delegate];
    if (self) {
        [self setContainerView:[self createDemoView_Camera]];
    }
    return self;
}


- (UIView *)createDemoView_Camera
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat ywidth = screenRect.size.width;
    CGFloat yheights = screenRect.size.height;

     demoView = [[UIView alloc] initWithFrame:CGRectMake(0,0, screenRect.size.width*0.80,screenRect.size.height*0.80)];
    [demoView setBackgroundColor:[UIColor clearColor]];
     demoView.layer.cornerRadius=5;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
     demoView.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    return demoView;
}

-(void)closeAlert:(id)sender{
    [self close];
}







@end
