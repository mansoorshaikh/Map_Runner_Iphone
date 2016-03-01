//
//  MenuViewController.m
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
#import "UIColor+Expanded.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "Reachability.h"
@import GoogleMobileAds;

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize mainimageView,playBtn,shareBtn,bobImg,simamImg,timer,ywidthbob,ywidthsim,leftposition,rightposition,topposition,bottomposition,simonArray,marginVO,indexvalue,simTop,simLeft;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden=YES;
    simonArray=[[NSMutableArray alloc]init];
    rightposition=NO;
    topposition=NO;
    bottomposition=NO;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat ywidth = screenRect.size.width;
    CGFloat yheights = screenRect.size.height;

    mainimageView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, ywidth,yheights)];
    [mainimageView setImage:[UIImage imageNamed:@"menubackimage.png"]];
    [self.view addSubview:mainimageView];

    playBtn=[[UIButton alloc]initWithFrame:CGRectMake(0,screenRect.size.height*0.67,screenRect.size.width,50)];
    [playBtn setTitle:@"Play" forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    playBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [playBtn.titleLabel setFont:[UIFont fontWithName:@"Hobo" size:60.0]];
    [self.view addSubview:playBtn];
    
    playBtn.alpha = 0.0f;
    [playBtn setTitleColor:[UIColor colorWithHexString:@"0041b2"] forState:UIControlStateNormal];
    playBtn.transform = CGAffineTransformMakeScale(1.5,1.5);
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:5000];
    playBtn.transform = CGAffineTransformMakeScale(0.8,0.8);
    playBtn.alpha = 1.0f;
    [UIView commitAnimations];
    
    shareBtn=[[UIButton alloc]initWithFrame:CGRectMake(0,screenRect.size.height*0.80,screenRect.size.width,50)];
    [shareBtn.titleLabel setFont:[UIFont fontWithName:@"Hobo" size:60.0]];
    [shareBtn setTitle:@"Share" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.view addSubview:shareBtn];
    
    shareBtn.alpha = 0.0f;
    [shareBtn setTitleColor:[UIColor colorWithHexString:@"0041b2"] forState:UIControlStateNormal];
    shareBtn.transform = CGAffineTransformMakeScale(1.0,1.0);
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:5000];
    shareBtn.transform = CGAffineTransformMakeScale(0.7,0.7);
    shareBtn.alpha = 1.0f;
    [UIView commitAnimations];

     ywidthbob = screenRect.size.height*0.90;
     ywidthsim = screenRect.size.height*0.10;
    leftposition=YES;
    indexvalue=0;
    marginVO=[[MarginVO alloc]init];
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.015 target:self selector:@selector(DateFunction) userInfo:nil repeats: YES];
}
-(void)DateFunction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    [bobImg removeFromSuperview];
    [simamImg removeFromSuperview];
    
    CGFloat checkcod = screenRect.size.height*0.07;
    CGFloat checkcods = screenRect.size.width*0.85;
    CGFloat checkcodss = screenRect.size.height*0.90;
    CGFloat checkcodsss = screenRect.size.width*0.10;

    if (leftposition==YES) {
    if (checkcod>=ywidthbob) {
        leftposition=NO;
        rightposition=NO;
        topposition=YES;
        bottomposition=NO;
        ywidthsim = screenRect.size.width*0.10;
       // ywidthsim = screenRect.size.width*0.10;

    }else{
        ywidthbob=ywidthbob-(screenRect.size.height*0.003);
       // ywidthsim=ywidthsim-(screenRect.size.height*0.003);
        ywidthsim=screenRect.size.width*0.10;
        bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*0.10,ywidthbob, screenRect.size.height*0.07,screenRect.size.height*0.07)];

        }
    }else if (topposition==YES) {
        if (checkcods<=ywidthsim) {
            leftposition=NO;
            rightposition=YES;
            topposition=NO;
            bottomposition=NO;
            ywidthbob = screenRect.size.height*0.07;
            //ywidthsim = screenRect.size.height*0.07;

        }else{
            ywidthsim=ywidthsim+(screenRect.size.width*0.005);
            ywidthbob=screenRect.size.height*0.07;
            //ywidthsim=ywidthsim+(screenRect.size.width*0.003);
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(ywidthsim,screenRect.size.height*0.07, screenRect.size.height*0.07,screenRect.size.height*0.07)];
            //simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(ywidthsim,screenRect.size.height*0.10, screenRect.size.height*0.05,screenRect.size.height*0.05)];
        }
    }else if (rightposition==YES) {
        if (checkcodss<=ywidthbob) {
            leftposition=NO;
            rightposition=NO;
            topposition=NO;
            bottomposition=YES;
            ywidthsim = screenRect.size.width*0.85;
            //ywidthsim = screenRect.size.width*0.85;

        }else{
            ywidthbob=ywidthbob+(screenRect.size.height*0.003);
            //ywidthsim=ywidthsim+(screenRect.size.height*0.003);
            ywidthsim=screenRect.size.width*0.85;

            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*0.85,ywidthbob, screenRect.size.height*0.07,screenRect.size.height*0.07)];
           // simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(screenRect.size.width*0.90,ywidthsim, screenRect.size.height*0.05,screenRect.size.height*0.05)];
        }
    }else if (bottomposition==YES) {
        if (checkcodsss>=ywidthsim) {
            leftposition=YES;
            rightposition=NO;
            topposition=NO;
            bottomposition=NO;
            ywidthbob = screenRect.size.height*0.90;
            //ywidthsim = screenRect.size.height*0.85;

        }else{
            ywidthsim=ywidthsim-(screenRect.size.width*0.005);
            //ywidthsim=ywidthsim-(screenRect.size.height*0.003);
            ywidthbob=screenRect.size.height*0.90;
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(ywidthsim,screenRect.size.height*0.90, screenRect.size.height*0.07,screenRect.size.height*0.07)];
        }
    }
      [bobImg setImage:[UIImage imageNamed:@"bobimage.png"]];
    [self.view addSubview:bobImg];
    marginVO=[[MarginVO alloc]init];
    marginVO.simLeftRight=[NSString stringWithFormat: @"%.4f", ywidthsim];
    marginVO.simTopDown=[NSString stringWithFormat: @"%.4f", ywidthbob];
    [simonArray addObject:marginVO];
    
    if (simonArray.count>=50) {
        [simamImg removeFromSuperview];
        marginVO=[[MarginVO alloc]init];
        marginVO=[simonArray objectAtIndex:indexvalue];
        simTop=(CGFloat)[marginVO.simTopDown floatValue];
        simLeft=(CGFloat)[marginVO.simLeftRight floatValue];

        //simTop=simTop-(screenRect.size.height*0.003);
        simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(simLeft,simTop, screenRect.size.height*0.07,screenRect.size.height*0.07)];
        [simamImg setImage:[UIImage imageNamed:@"simamimage.png"]];
        [self.view addSubview:simamImg];
        
        indexvalue=indexvalue+1;
    }
}
-(void)playAction{
    HomeViewController *home;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        home=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    }else{
        home=[[HomeViewController alloc] initWithNibName:@"HomeViewController~ipad" bundle:nil];
    }
    [self.navigationController pushViewController:home animated:NO];
}

-(void)shareAction{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerts show];
    }else{

    if (![[UIApplication sharedApplication] openURL: [NSURL URLWithString:@"fb://profile/534278026736224"]])
    {
        NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/534278026736224"];
        [[UIApplication sharedApplication] openURL:url];
    }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
