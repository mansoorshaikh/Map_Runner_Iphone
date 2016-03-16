//
//  HomeViewController.m
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+Expanded.h"
#import "MenuViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AudioToolbox/AudioServices.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <UIKit/UIKit.h>
@import GoogleMobileAds;
@interface HomeViewController ()


@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation HomeViewController
@synthesize roadView,mainscrollview,leftgreenImg,topgreenImg,rightwaterImg,downwaterImg,insideFirstImg,insideFirstImg1,insideFirstImg2,insideFirstImg3,insideFirstImg4,bobImg,simamImg,simonArray,marginVO,timer,ywidthbobTop,ywidthsimLeft,BOB_LEFT_MARGIN,BOB_T0P_MARGIN,isMovingUp,isMovingDown,isMovingLeft,isMovingRight,indexvalue,position,startPosition,SIMAN_LEFT_MARGIN,SIMAN_T0P_MARGIN,hor_1_top ,hor_2_top ,hor_3_top,hor_4_top,hor_5_top,hor_6_top,hor_7_top,hor_8_top,ver_1_left,ver_2_left,ver_3_left,ver_4_left,ver_5_left,ver_6_left,isValidMove,isGAMEOVER,isMaproad1_1,isMaproad1_2,isMaproad1_3,isMaproad1_4,isMaproad2_1,isMaproad2_2,isMaproad2_3,isMaproad2_4,isMaproad3_1,isMaproad3_2,isMaproad3_3,isMaproad3_4,isMaproad4_1,isMaproad4_2,isMaproad4_3,isMaproad4_4,isPause,isSimanMove,isWait,isBottom_to_Top,isTop_to_Bottom,isLeft_to_Right,isRight_to_Left,ywidth,yheights,alert,cav,alertView,bgImage,ywidthbob,ywidthsim,simTop,simLeft,timer2,scoreLbl,highScoreLbl,titleName,maryNameLbl,hydeparkNameLbl1,hydeparkNameLbl,mayfairNameLbl,greenparkNameLbl,southNameLbl,maryroadNameLbl,paddingNameLbl,edgwareNameLbl,bakerNameLbl,gioucesterNameLbl,marleboneyNameLbl,bondstreetNameLbl,grosvenorstreetNameLbl,newbondNameLbl,berkeleyNameLbl,stratonstreetNameLbl,berkeleystreetNameLbl,piccadillyNameLbl,knighsNameLbl,queenNameLbl,bromptNameLbl,slonneNameLbl,thurloeNameLbl,gloucesterNameLbl,gloucester1NameLbl,kingsNameLbl,chelseaNameLbl,eustonNameLbl,gowerNameLbl,bloomsburyNameLbl,goodgeNameLbl,russelNameLbl,tottennamNameLbl,bloomsburyStreetNameLbl,oxfordNameLbl,sohoNameLbl,regentNameLbl,shaffesburyNameLbl,piccadilly1NameLbl,belgraviaNameLbl,cadoganNameLbl,eatonNameLbl,grosvenerNameLbl,ecclestenNameLbl,buckinghamNameLbl,belgraveNameLbl,gowersNameLbl,juddNameLbl,graysNameLbl,theobaldsNameLbl,southampNameLbl,highholbornNameLbl,holbornNameLbl,longNameLbl,kingswayNameLbl,stNameLbl,coventNameLbl,aldwychNameLbl,whiteNameLbl,victoryaNameLbl,parliamentNameLbl,victoriaNameLbl,westNameLbl,buckkingNameLbl,marshamNameLbl,millbankNameLbl,greatNameLbl,horebwrryNameLbl,rochNameLbl,vauxhallNameLbl,redcolor,indexvlaueRedimg,indexvalueRedimgCompa,score,redimageArray,imageIndex,signalBtn1,signalBtn2,signalBtn3,signalBtn4,signalBtn5,signalBtn6,signalBtn7,signalBtn8,signalBtn9,signalBtn10,signalBtn11,signalBtn12,signalBtn13,signalBtn14,signalBtn15,signalBtn16,signalBtn17,signalBtn18,signalBtn19,signalBtn20,signalBtn21,signalBtn22,signalBtn23,signalBtn24,signalBtn25,signalBtn26,signalBtn27,signalBtn28,CURRENT_SCORE,Updatescoretime,Score_startTime,Score_timeInMilliseconds,Score_timeSwapBuff,Score_updatedTime,STARTSEC , CURRENTSEC,redline,updatemint,scoreDisplyayLbl,highScoreDisplayLbl,scoreValuess,bobleftmargin,bobtopmargin,pauseBtn,timeSwapBuff,bobrightmargin,bobdownmarign,vibrateCount,vibrateTimer,admobCount,bobSpeed,yheightsim,newscore,repeatpointsDict;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    repeatpointsDict=  [[NSMutableDictionary alloc] init];
    
    self.navigationController.navigationBarHidden=YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    self.interstitial = [[GADInterstitial alloc] init ];
                         
           self.interstitial.adUnitID=@"ca-app-pub-1192482966027684/6699631853";
    self.interstitial.delegate = self;

    GADRequest *request = [GADRequest request];
    // Requests test ads on test devices.
    request.testDevices = @[@"2077ef9a63d2b398840261c8221a0c9b"];
    [self.interstitial loadRequest:request];

    simonArray=[[NSMutableArray alloc]init];
    redimageArray=[[NSMutableArray alloc]init];
    scoreValuess=0;
    admobCount=0;
    bobSpeed=0;
    vibrateCount = 0;
    isMovingDown=NO;
    isMovingLeft=NO;
    isMovingRight=NO;
    score=0;
    hor_1_top = 0.085;
    hor_2_top = 0.205;
    hor_3_top = 0.285;
    hor_4_top = 0.385;
    hor_5_top = 0.485;
    hor_6_top = 0.635;
    hor_7_top = 0.735;
    hor_8_top = 0.885;
    ver_1_left = 0.08;
    ver_2_left = 0.23;
    ver_3_left = 0.33;
    ver_4_left = 0.48;
    ver_5_left = 0.73;
    ver_6_left = 0.88;
    isGAMEOVER=false;
    isValidMove=true;
    isPause=false;
    isSimanMove=false;
    isWait=false;
    isBottom_to_Top=true;isTop_to_Bottom=false;isLeft_to_Right=true;isRight_to_Left=false;
    isMaproad1_1 = false;
    isMaproad1_2 = false;
    isMaproad1_3 = false;
    isMaproad1_4 = false; isMaproad2_1 = false;
    isMaproad2_2 = true; isMaproad2_3 = false; isMaproad2_4 = false;
    isMaproad3_1 = false; isMaproad3_2 = false; isMaproad3_3 = false;
    isMaproad3_4 = false; isMaproad4_1 = false; isMaproad4_2 = false;
    isMaproad4_3 = false; isMaproad4_4= false;
    STARTSEC = 0, CURRENTSEC = 0;
    CURRENT_SCORE = 0;
     score = 0, redline = 500,Updatescoretime=25;
    newscore=0;
    Score_startTime = 0L;
     Score_timeInMilliseconds = 0L;
     Score_timeSwapBuff = 0L;
     Score_updatedTime = 0L;
     updatemint = 1;
    Score_startTime=[[NSDate date] timeIntervalSince1970];
    //map road 1 row 1 column
    //horizontally map design code
    self.view.backgroundColor=[UIColor colorWithHexString:@"d2be96"];
    NSUserDefaults *prefscore = [NSUserDefaults standardUserDefaults];
    [highScoreDisplayLbl removeFromSuperview];
    highScoreDisplayLbl=[[UILabel alloc]initWithFrame:CGRectMake(85,35, 100,30)];
    highScoreDisplayLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
    highScoreDisplayLbl.textColor=[UIColor blackColor];
    if ([prefscore objectForKey:@"score"]==nil) {
        highScoreDisplayLbl.text=@"0";

    }else{
        highScoreDisplayLbl.text=[prefscore objectForKey:@"score"];

    }
    [self.view addSubview:highScoreDisplayLbl];
    [self.view bringSubviewToFront:highScoreDisplayLbl];
    
    [self AllViewDisplay];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    // Do any additional setup after loading the view from its nib.
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)interstitial:(GADInterstitial *)interstitial
didFailToReceiveAdWithError:(GADRequestError *)error {
    //NSLog(@"interstitialDidFailToReceiveAdWithError: %@", [error localizedDescription]);
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    //NSLog(@"interstitialDidDismissScreen");
    [self dialogAction];

    self.interstitial = [[GADInterstitial alloc] init];
                          
self.interstitial.adUnitID=@"ca-app-pub-1192482966027684/6699631853";
                         self.interstitial.delegate = self;

    GADRequest *request = [GADRequest request];
    // Requests test ads on test devices.
    request.testDevices = @[@"2077ef9a63d2b398840261c8221a0c9b"];
    [self.interstitial loadRequest:request];

}
-(void)AllViewDisplay{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    ywidth = screenRect.size.width;
    yheights = screenRect.size.height;
    bobleftmargin= screenRect.size.width*0.70;
    bobtopmargin=screenRect.size.height*0.60;
    bobrightmargin= screenRect.size.height*0.62;
    bobdownmarign= screenRect.size.width*0.70;
    scoreLbl=[[UILabel alloc]initWithFrame:CGRectMake(5,10, 80,30)];
    scoreLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
    scoreLbl.text=@"Score:";
    scoreLbl.textColor=[UIColor blackColor];
    [self.view addSubview:scoreLbl];
    [self.view bringSubviewToFront:scoreLbl];
    
    //scoreDisplyayLbl=[[UILabel alloc]initWithFrame:CGRectMake(60,10, 80,30)];
   // scoreDisplyayLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
    //scoreDisplyayLbl.textColor=[UIColor blackColor];
    //[self.view addSubview:scoreDisplyayLbl];
    //[self.view bringSubviewToFront:scoreDisplyayLbl];
    
    highScoreLbl=[[UILabel alloc]initWithFrame:CGRectMake(5,35, 100,30)];
    highScoreLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
    highScoreLbl.text=@"High Score :";
    highScoreLbl.textColor=[UIColor blackColor];
    [self.view addSubview:highScoreLbl];
    [self.view bringSubviewToFront:highScoreLbl];
    
    //highScoreDisplayLbl=[[UILabel alloc]initWithFrame:CGRectMake(85,35, 100,30)];
    //highScoreDisplayLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
   // highScoreDisplayLbl.textColor=[UIColor blackColor];
   // NSUserDefaults *prefscore = [NSUserDefaults standardUserDefaults];
   // highScoreDisplayLbl.text=[prefscore objectForKey:@"score"];
   // [self.view addSubview:highScoreDisplayLbl];
   // [self.view bringSubviewToFront:highScoreDisplayLbl];
    
    pauseBtn=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.85),13, 40,40)];
    //[pauseBtn setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    [pauseBtn setBackgroundImage:[UIImage imageNamed:@"pause.png"]
                        forState:UIControlStateNormal];
    [pauseBtn addTarget:self action:@selector(pauseView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseBtn];
    //water and green image set in background of map
    CGFloat imgwidth = (screenRect.size.width*0.10);
    CGFloat imgheight = (screenRect.size.height*0.60);
    
    leftgreenImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, screenRect.size.height*1.10, imgwidth,imgheight)];
    [leftgreenImg setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:leftgreenImg];
    
    topgreenImg=[[UIImageView alloc]initWithFrame:CGRectMake(imgwidth,-20,screenRect.size.width*1.75,(screenRect.size.height*0.10)+20)];
    [topgreenImg setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:topgreenImg];
    
    rightwaterImg=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*3.0),(screenRect.size.height*0.70),screenRect.size.width*1.5,(screenRect.size.height*4.0) )];
    [rightwaterImg setBackgroundColor:[UIColor colorWithHexString:@"beebfe"]];
    [self.mainscrollview addSubview:rightwaterImg];
    
    downwaterImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,(screenRect.size.height*3.0),screenRect.size.width*4.0,(screenRect.size.height*1.5) )];
    [downwaterImg setBackgroundColor:[UIColor colorWithHexString:@"beebfe"]];
    [self.mainscrollview addSubview:downwaterImg];
    
    insideFirstImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,(screenRect.size.height*0.77),(screenRect.size.width*0.50),(screenRect.size.height*0.35) )];
    [insideFirstImg setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    // [self.mainscrollview addSubview:insideFirstImg];
    
    insideFirstImg1=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*1.93),(screenRect.size.height*0.65),(screenRect.size.width*0.18),(screenRect.size.height*0.12) )];
    [insideFirstImg1 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:insideFirstImg1];
    
    insideFirstImg2=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*1.20),(screenRect.size.height*0.90),(screenRect.size.width*0.32),(screenRect.size.height*0.20) )];
    [insideFirstImg2 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    //[self.mainscrollview addSubview:insideFirstImg2];
    
    insideFirstImg3=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*0.10),(screenRect.size.height*1.50),(screenRect.size.width*0.44),(screenRect.size.height*0.15) )];
    [insideFirstImg3 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:insideFirstImg3];
    
    insideFirstImg4=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*0.27),(screenRect.size.height*1.92),(screenRect.size.width*0.67),(screenRect.size.height*0.20) )];
    [insideFirstImg4 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:insideFirstImg4];
    
    
    
    
    CGFloat herleft1 = (screenRect.size.width*0.10);
    CGFloat herleft2 = (screenRect.size.width*0.20);
    CGFloat herleft8 = (screenRect.size.width*0.45);
    
    CGFloat hertop1 = (screenRect.size.height*0.10);
    CGFloat hertop2 = (screenRect.size.height*0.22);
    CGFloat hertop3 = (screenRect.size.height*0.30);
    CGFloat hertop4 = (screenRect.size.height*0.40);
    CGFloat hertop5 = (screenRect.size.height*0.50);
    CGFloat hertop6 = (screenRect.size.height*0.65);
    CGFloat hertop7 = (screenRect.size.height*0.75);
    CGFloat hertop8 = (screenRect.size.height*0.90);
    
    CGFloat herwidth1 = (screenRect.size.width*0.81);
    CGFloat herwidth2 = (screenRect.size.width*0.80);
    CGFloat herwidth3 = (screenRect.size.width*0.66);
    CGFloat herwidth5 = (screenRect.size.width*0.91);
    CGFloat herwidth6 = (screenRect.size.width*0.41);
    CGFloat herwidth7 = (screenRect.size.width*0.90);
    CGFloat herwidth8 = (screenRect.size.width*0.46);
    
    CGFloat herheight1 = (screenRect.size.width*4)/100;
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft1,hertop1, herwidth1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2,hertop2, herwidth2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft1,hertop3, herwidth3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft1,hertop4, herwidth1, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft1,hertop5, herwidth5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft1,hertop6, herwidth6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft1,hertop7, herwidth7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft8,hertop8, herwidth8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    CGFloat verleft1 = (screenRect.size.width*0.10);
    CGFloat verleft2 = (screenRect.size.width*0.25);
    CGFloat verleft3 = (screenRect.size.width*0.35);
    CGFloat verleft4 = (screenRect.size.width*0.50);
    CGFloat verleft5 = (screenRect.size.width*0.75);
    CGFloat verleft6 = (screenRect.size.width*0.90);
    
    CGFloat vertop1 = (screenRect.size.height*5)/100;
    CGFloat vertop2 = (screenRect.size.height*0.65);
    CGFloat vertop3 = (screenRect.size.height*0.10);
    
    CGFloat verwidth1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight1 = (screenRect.size.height*0.71);
    CGFloat verheight2 = (screenRect.size.height*0.11);
    CGFloat verheight3 = (screenRect.size.height*0.41);
    CGFloat verheight4 = (screenRect.size.height*0.96);
    CGFloat verheight5 = (screenRect.size.height*0.81);
    CGFloat verheight6 = (screenRect.size.height*0.90);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft1,vertop1, verwidth1, verheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2,vertop2, verwidth1, verheight2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft3,vertop3, verwidth1, verheight3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft4,vertop1, verwidth1, verheight4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft5,vertop3, verwidth1, verheight5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft6,vertop3, verwidth1, verheight6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //map road 1 row 2 column
    //horizontally map design code
    
    CGFloat herleft_1r_2c_1 = (screenRect.size.width*1.10);
    CGFloat herleft_1r_2c_2 = (screenRect.size.width*0.99);
    CGFloat herleft_1r_2c_3 = (screenRect.size.width*1.10);
    CGFloat herleft_1r_2c_5 = screenRect.size.width;
    CGFloat herleft_1r_2c_6 = (screenRect.size.width*1.60);
    CGFloat herleft_1r_2c_7 = (screenRect.size.width*0.99);
    CGFloat herleft_1r_2c_8 = (screenRect.size.width*1.25);
    
    
    CGFloat herwidth_1r_2c_1 = (screenRect.size.width*0.91);
    CGFloat herwidth_1r_2c_2 = (screenRect.size.width*0.93);
    CGFloat herwidth_1r_2c_3 = (screenRect.size.width*0.26);
    CGFloat herwidth_1r_2c_4 = (screenRect.size.width*0.41);
    CGFloat herwidth_1r_2c_5 = (screenRect.size.width*0.91);
    CGFloat herwidth_1r_2c_6 = (screenRect.size.width*0.41);
    CGFloat herwidth_1r_2c_7 = (screenRect.size.width*0.94);
    CGFloat herwidth_1r_2c_8 = (screenRect.size.width*0.53);
    
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_1,hertop1, herwidth_1r_2c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_2,hertop2, herwidth_1r_2c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_3,hertop3, herwidth_1r_2c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_3,hertop4, herwidth_1r_2c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_5,hertop5, herwidth_1r_2c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_6,hertop6, herwidth_1r_2c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_7,hertop7, herwidth_1r_2c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_2c_8,hertop8, herwidth_1r_2c_8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    CGFloat verleft2_1 = (screenRect.size.width*1.10);
    CGFloat verleft2_2 = (screenRect.size.width*1.25);
    CGFloat verleft2_3 = (screenRect.size.width*1.35);
    CGFloat verleft2_4 = (screenRect.size.width*1.50);
    CGFloat verleft2_5 = (screenRect.size.width*1.75);
    CGFloat verleft2_6 = (screenRect.size.width*1.90);
    
    CGFloat vertop_1r_2c_1 = (screenRect.size.height*0.10);
    CGFloat vertop_1r_2c_2 = (screenRect.size.height*0.75);
    CGFloat vertop_1r_2c_6 = screenRect.size.height*0.06;
    
    CGFloat verwidth_1r_2c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_1r_2c_1 = (screenRect.size.height*0.66);
    CGFloat verheight_1r_2c_2 = (screenRect.size.height*0.16);
    CGFloat verheight_1r_2c_3 = (screenRect.size.height*0.57);
    CGFloat verheight_1r_2c_4 = (screenRect.size.height*0.91);
    CGFloat verheight_1r_2c_5 = (screenRect.size.height*0.91);
    CGFloat verheight_1r_2c_6 = (screenRect.size.height*0.715);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_1,vertop_1r_2c_1, verwidth_1r_2c_1, verheight_1r_2c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_2,vertop_1r_2c_2, verwidth_1r_2c_1, verheight_1r_2c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_3,vertop_1r_2c_1, verwidth_1r_2c_1, verheight_1r_2c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_4,vertop_1r_2c_1, verwidth_1r_2c_1, verheight_1r_2c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_5,vertop_1r_2c_1, verwidth_1r_2c_1, verheight_1r_2c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_6,vertop_1r_2c_6, verwidth_1r_2c_1, verheight_1r_2c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //map road 1 row 3 column
    //horizontally map design code
    
    CGFloat herleft_1r_3c_1 = (screenRect.size.width*1.99);
    CGFloat herleft_1r_3c_2 = (screenRect.size.width*2.50);
    CGFloat herleft_1r_3c_3 = (screenRect.size.width*2.35);
    CGFloat herleft_1r_3c_4 = (screenRect.size.width*2.10);
    CGFloat herleft_1r_3c_5 = (screenRect.size.width*2.35);
    CGFloat herleft_1r_3c_6 = (screenRect.size.width*1.99);
    CGFloat herleft_1r_3c_7 = (screenRect.size.width*2.10);
    CGFloat herleft_1r_3c_8 = (screenRect.size.width*2.25);
    
    
    CGFloat herwidth_1r_3c_1 = (screenRect.size.width*0.95);
    CGFloat herwidth_1r_3c_2 = (screenRect.size.width*0.40);
    CGFloat herwidth_1r_3c_3 = (screenRect.size.width*0.26);
    CGFloat herwidth_1r_3c_4 = (screenRect.size.width*0.41);
    CGFloat herwidth_1r_3c_5 = (screenRect.size.width*0.65);
    CGFloat herwidth_1r_3c_6 = (screenRect.size.width*0.41);
    CGFloat herwidth_1r_3c_7 = (screenRect.size.width*0.91);
    CGFloat herwidth_1r_3c_8 = (screenRect.size.width*0.50);
    
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_1,hertop1, herwidth_1r_3c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_2,hertop2, herwidth_1r_3c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_3,hertop3, herwidth_1r_3c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_4,hertop4, herwidth_1r_3c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_5,hertop5, herwidth_1r_3c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_6,hertop6, herwidth_1r_3c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_7,hertop7, herwidth_1r_3c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_1r_3c_8,hertop8, herwidth_1r_3c_8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    CGFloat verleft_1r_3c_1 = (screenRect.size.width*2.10);
    CGFloat verleft_1r_3c_2 = (screenRect.size.width*2.25);
    CGFloat verleft_1r_3c_3 = (screenRect.size.width*2.35);
    CGFloat verleft_1r_3c_4 = (screenRect.size.width*2.50);
    CGFloat verleft_1r_3c_5 = (screenRect.size.width*2.75);
    CGFloat verleft_1r_3c_6 = (screenRect.size.width*2.90);
    
    CGFloat vertop_1r_3c_1 = (screenRect.size.height*0.10);
    CGFloat vertop_1r_3c_2 = (screenRect.size.height*0.75);
    
    CGFloat verwidth_1r_3c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_1r_3c_1 = (screenRect.size.height*0.91);
    CGFloat verheight_1r_3c_2 = (screenRect.size.height*0.16);
    CGFloat verheight_1r_3c_3 = (screenRect.size.height*0.51);
    CGFloat verheight_1r_3c_4 = (screenRect.size.height*0.81);
    CGFloat verheight_1r_3c_5 = (screenRect.size.height*0.91);
    CGFloat verheight_1r_3c_6 = (screenRect.size.height*0.705);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_1,vertop_1r_3c_1, verwidth_1r_3c_1, verheight_1r_3c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_2,vertop_1r_3c_2, verwidth_1r_3c_1, verheight_1r_3c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_3,vertop_1r_3c_1, verwidth_1r_3c_1, verheight_1r_3c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_4,vertop_1r_3c_1, verwidth_1r_3c_1, verheight_1r_3c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_5,vertop_1r_3c_1, verwidth_1r_3c_1, verheight_1r_3c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_6,vertop_1r_3c_1, verwidth_1r_3c_1, verheight_1r_3c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    
    //map road 2 row 1 column
    //horizontally map design code
    
    CGFloat herleft2_1 = (screenRect.size.width*0.10);
    CGFloat herleft2_3 = (screenRect.size.width*0.25);
    
    CGFloat hertop2_1 = (screenRect.size.height*1.10);
    CGFloat hertop2_2 = (screenRect.size.height*1.22);
    CGFloat hertop2_3 = (screenRect.size.height*1.30);
    CGFloat hertop2_4 = (screenRect.size.height*1.40);
    CGFloat hertop2_5 = (screenRect.size.height*1.50);
    CGFloat hertop2_6 = (screenRect.size.height*1.65);
    CGFloat hertop2_7 = (screenRect.size.height*1.75);
    CGFloat hertop2_8 = (screenRect.size.height*1.90);
    
    CGFloat herwidth2_1 = (screenRect.size.width*0.81);
    CGFloat herwidth2_2 = (screenRect.size.width*0.73);
    CGFloat herwidth2_3 = (screenRect.size.width*0.76);
    CGFloat herwidth2_4 = (screenRect.size.width*0.26);
    CGFloat herwidth2_5 = (screenRect.size.width*0.81);
    CGFloat herwidth2_6 = (screenRect.size.width*0.90);
    CGFloat herwidth2_7 = (screenRect.size.width*0.81);
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_1, herwidth2_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_2, herwidth2_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_3,hertop2_3, herwidth2_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_4, herwidth2_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_5, herwidth2_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_6, herwidth2_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_7, herwidth2_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft2_1,hertop2_8, herwidth2_7, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    
    CGFloat vertop2_1 = (screenRect.size.height*1.10);
    CGFloat vertop2_2 = (screenRect.size.height*1.65);
    CGFloat vertop2_4 = screenRect.size.height;
    
    CGFloat verwidth2_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight2_1 = (screenRect.size.height*0.90);
    CGFloat verheight2_2 = (screenRect.size.height*0.35);
    CGFloat verheight2_3 = (screenRect.size.height*0.51);
    CGFloat verheight2_4 = (screenRect.size.height*0.90);
    CGFloat verheight2_5 = (screenRect.size.height*0.85);
    CGFloat verheight2_6 = (screenRect.size.height*0.921);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft1,vertop2_1, verwidth2_1, verheight2_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2,vertop2_2, verwidth2_1, verheight2_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft3,vertop2_1, verwidth2_1, verheight2_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft4,vertop2_4, verwidth2_1, verheight2_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft5,vertop2_1, verwidth2_1, verheight2_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft6,vertop2_4, verwidth2_1, verheight2_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //map road 2 row 2 column
    //horizontally map design code
    
    CGFloat herleft_2r_2c_1 = (screenRect.size.width*1.10);
    CGFloat herleft_2r_2c_3 = (screenRect.size.width*0.99);
    CGFloat herleft_2r_2c_4 = (screenRect.size.width*1.50);
    CGFloat herleft_2r_2c_8 = (screenRect.size.width*1.25);
    
    CGFloat herwidth_2r_2c_1 = (screenRect.size.width*0.81);
    CGFloat herwidth_2r_2c_2 = (screenRect.size.width*0.90);
    CGFloat herwidth_2r_2c_3 = (screenRect.size.width*0.25);
    CGFloat herwidth_2r_2c_4 = (screenRect.size.width*0.41);
    CGFloat herwidth_2r_2c_5 = (screenRect.size.width*0.81);
    CGFloat herwidth_2r_2c_6 = (screenRect.size.width*0.41);
    CGFloat herwidth_2r_2c_7 = (screenRect.size.width*0.91);
    CGFloat herwidth_2r_2c_8 = (screenRect.size.width*0.53);
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_1,hertop2_1, herwidth_2r_2c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_1,hertop2_2, herwidth_2r_2c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_3,hertop2_3, herwidth_2r_2c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_4,hertop2_4, herwidth_2r_2c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_1,hertop2_5, herwidth_2r_2c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_3,hertop2_6, herwidth_2r_2c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_1,hertop2_7, herwidth_2r_2c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_2c_8,hertop2_8, herwidth_2r_2c_8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    
    CGFloat vertop_2r_2c_1 = (screenRect.size.height*1.10);
    CGFloat vertop_2r_2c_2 = (screenRect.size.height*1.75);
    CGFloat vertop_2r_2c_4 = (screenRect.size.height*0.99);
    
    CGFloat verwidth_2r_2c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_2r_2c_1 = (screenRect.size.height*0.66);
    CGFloat verheight_2r_2c_2 = (screenRect.size.height*0.16);
    CGFloat verheight_2r_2c_3 = (screenRect.size.height*0.51);
    CGFloat verheight_2r_2c_4 = (screenRect.size.height*0.91);
    CGFloat verheight_2r_2c_5 = (screenRect.size.height*1.003);
    CGFloat verheight_2r_2c_6 = (screenRect.size.height*0.90);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_1,vertop_2r_2c_1, verwidth_2r_2c_1, verheight_2r_2c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_2,vertop_2r_2c_2, verwidth_2r_2c_1, verheight_2r_2c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_3,vertop_2r_2c_1, verwidth_2r_2c_1, verheight_2r_2c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_4,vertop_2r_2c_4, verwidth_2r_2c_1, verheight_2r_2c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_5,vertop_2r_2c_4, verwidth_2r_2c_1, verheight_2r_2c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_6,vertop_2r_2c_1, verwidth_2r_2c_1, verheight_2r_2c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //map road 2 row 3 column
    //horizontally map design code
    
    CGFloat herleft_2r_3c_1 = (screenRect.size.width*2.10);
    CGFloat herleft_2r_3c_2 = (screenRect.size.width*1.995);
    CGFloat herleft_2r_3c_3 = (screenRect.size.width*2.35);
    CGFloat herleft_2r_3c_4 = (screenRect.size.width*2.10);
    CGFloat herleft_2r_3c_5 = (screenRect.size.width*2.22);
    CGFloat herleft_2r_3c_6 = (screenRect.size.width*2.10);
    CGFloat herleft_2r_3c_7 = (screenRect.size.width*1.995);
    CGFloat herleft_2r_3c_8 = (screenRect.size.width*2.25);
    
    
    CGFloat herwidth_2r_3c_1 = (screenRect.size.width*0.81);
    CGFloat herwidth_2r_3c_2 = (screenRect.size.width*0.43);
    CGFloat herwidth_2r_3c_3 = (screenRect.size.width*0.65);
    CGFloat herwidth_2r_3c_4 = (screenRect.size.width*0.90);
    CGFloat herwidth_2r_3c_5 = (screenRect.size.width*0.69);
    CGFloat herwidth_2r_3c_6 = (screenRect.size.width*0.81);
    CGFloat herwidth_2r_3c_7 = (screenRect.size.width*0.26);
    CGFloat herwidth_2r_3c_8 = (screenRect.size.width*0.53);
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_1,hertop2_1, herwidth_2r_3c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_2,hertop2_2, herwidth_2r_3c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_3,hertop2_3, herwidth_2r_3c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_4,hertop2_4, herwidth_2r_3c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_5,hertop2_5, herwidth_2r_3c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_6,hertop2_6, herwidth_2r_3c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_7,hertop2_7, herwidth_2r_3c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_2r_3c_8,hertop2_8, herwidth_2r_3c_8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    
    CGFloat vertop_2r_3c_1 = (screenRect.size.height*0.995);
    CGFloat vertop_2r_3c_2 = (screenRect.size.height*1.75);
    CGFloat vertop_2r_3c_3 = (screenRect.size.height*1.10);
    
    CGFloat verwidth_2r_3c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_2r_3c_1 = (screenRect.size.height*0.76);
    CGFloat verheight_2r_3c_2 = (screenRect.size.height*0.16);
    CGFloat verheight_2r_3c_3 = (screenRect.size.height*0.51);
    CGFloat verheight_2r_3c_4 = (screenRect.size.height*0.90);
    CGFloat verheight_2r_3c_5 = (screenRect.size.height*0.93);
    CGFloat verheight_2r_3c_6 = (screenRect.size.height*0.90);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_1,vertop_2r_3c_1, verwidth_2r_3c_1, verheight_2r_3c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_2,vertop_2r_3c_2, verwidth_2r_3c_1, verheight_2r_3c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_3,vertop_2r_3c_3, verwidth_2r_3c_1, verheight_2r_3c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_4,vertop_2r_3c_3, verwidth_2r_3c_1, verheight_2r_3c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_5,vertop_2r_3c_1, verwidth_2r_3c_1, verheight_2r_3c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_6,vertop_2r_3c_3, verwidth_2r_3c_1, verheight_2r_3c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    
    //map road 3 row 1 column
    //horizontally map design code
    
    CGFloat herleft_3r_1c_1 = (screenRect.size.width*0.10);
    CGFloat herleft_3r_1c_3 = (screenRect.size.width*0.25);
    
    CGFloat hertop_3r_1c_1 = (screenRect.size.height*2.10);
    CGFloat hertop_3r_1c_2 = (screenRect.size.height*2.22);
    CGFloat hertop_3r_1c_3 = (screenRect.size.height*2.30);
    CGFloat hertop_3r_1c_4 = (screenRect.size.height*2.40);
    CGFloat hertop_3r_1c_5 = (screenRect.size.height*2.50);
    CGFloat hertop_3r_1c_6 = (screenRect.size.height*2.65);
    CGFloat hertop_3r_1c_7 = (screenRect.size.height*2.75);
    CGFloat hertop_3r_1c_8 = (screenRect.size.height*2.90);
    
    CGFloat herwidth_3r_1c_1 = (screenRect.size.width*0.81);
    CGFloat herwidth_3r_1c_2 = (screenRect.size.width*0.73);
    CGFloat herwidth_3r_1c_3 = (screenRect.size.width*0.51);
    CGFloat herwidth_3r_1c_4 = (screenRect.size.width*0.26);
    CGFloat herwidth_3r_1c_5 = (screenRect.size.width*0.81);
    CGFloat herwidth_3r_1c_6 = (screenRect.size.width*0.41);
    CGFloat herwidth_3r_1c_7 = (screenRect.size.width*0.91);
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_1, herwidth_3r_1c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_2, herwidth_3r_1c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_3,hertop_3r_1c_3, herwidth_3r_1c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_4, herwidth_3r_1c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_5, herwidth_3r_1c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_6, herwidth_3r_1c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_7, herwidth_3r_1c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_1c_1,hertop_3r_1c_8, herwidth_3r_1c_7, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    
    CGFloat vertop_3r_1c_1 = (screenRect.size.height*1.995);
    CGFloat vertop_3r_1c_3 = (screenRect.size.height*2.30);
    CGFloat vertop_3r_1c_4 = (screenRect.size.height*2.05);
    CGFloat vertop_3r_1c_5 = (screenRect.size.height*2.10);
    
    CGFloat verwidth_3r_1c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_3r_1c_1 = (screenRect.size.height*0.91);
    CGFloat verheight_3r_1c_2 = (screenRect.size.height*0.35);
    CGFloat verheight_3r_1c_3 = (screenRect.size.height*0.51);
    CGFloat verheight_3r_1c_4 = (screenRect.size.height*0.95);
    CGFloat verheight_3r_1c_5 = (screenRect.size.height*0.90);
    CGFloat verheight_3r_1c_6 = (screenRect.size.height*0.81);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft1,vertop_3r_1c_1, verwidth_3r_1c_1, verheight_3r_1c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2,vertop_3r_1c_1, verwidth_3r_1c_1, verheight_3r_1c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft3,vertop_3r_1c_3, verwidth_3r_1c_1, verheight_3r_1c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft4,vertop_3r_1c_4, verwidth_3r_1c_1, verheight_3r_1c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft5,vertop_3r_1c_5, verwidth_3r_1c_1, verheight_3r_1c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft6,vertop_3r_1c_5, verwidth_3r_1c_1, verheight_3r_1c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //map road 3 row 2 column
    //horizontally map design code
    
    CGFloat herleft_3r_2c_1 = (screenRect.size.width*1.10);
    CGFloat herleft_3r_2c_4 = (screenRect.size.width*1.50);
    CGFloat herleft_3r_2c_7 = (screenRect.size.width*0.995);
    
    CGFloat herwidth_3r_2c_1 = (screenRect.size.width*0.81);
    CGFloat herwidth_3r_2c_2 = (screenRect.size.width*0.41);
    CGFloat herwidth_3r_2c_3 = (screenRect.size.width*0.26);
    CGFloat herwidth_3r_2c_4 = (screenRect.size.width*0.51);
    CGFloat herwidth_3r_2c_5 = (screenRect.size.width*0.81);
    CGFloat herwidth_3r_2c_6 = (screenRect.size.width*0.91);
    CGFloat herwidth_3r_2c_7 = (screenRect.size.width*0.41);
    CGFloat herwidth_3r_2c_8 = (screenRect.size.width*0.53);
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_1,hertop_3r_1c_1, herwidth_3r_2c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_1,hertop_3r_1c_2, herwidth_3r_2c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_1,hertop_3r_1c_3, herwidth_3r_2c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_4,hertop_3r_1c_4, herwidth_3r_2c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_1,hertop_3r_1c_5, herwidth_3r_2c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_1,hertop_3r_1c_6, herwidth_3r_2c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_7,hertop_3r_1c_7, herwidth_3r_2c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_2c_7,hertop_3r_1c_8, herwidth_3r_2c_8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    
    CGFloat vertop_3r_2c_1 = (screenRect.size.height*2.10);
    CGFloat vertop_3r_2c_2 = (screenRect.size.height*2.75);
    CGFloat vertop_3r_2c_5 = (screenRect.size.height*1.99);
    CGFloat vertop_3r_2c_6 = (screenRect.size.height*1.995);
    
    CGFloat verwidth_3r_2c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_3r_2c_1 = (screenRect.size.height*0.66);
    CGFloat verheight_3r_2c_2 = (screenRect.size.height*0.16);
    CGFloat verheight_3r_2c_3 = (screenRect.size.height*0.51);
    CGFloat verheight_3r_2c_4 = (screenRect.size.height*0.90);
    CGFloat verheight_3r_2c_5 = (screenRect.size.height*0.75);
    CGFloat verheight_3r_2c_6 = (screenRect.size.height*1.005);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_1,vertop_3r_2c_1, verwidth_3r_2c_1, verheight_3r_2c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_2,vertop_3r_2c_2, verwidth_3r_2c_1, verheight_3r_2c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_3,vertop_3r_2c_1, verwidth_3r_2c_1, verheight_3r_2c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_4,vertop_3r_2c_1, verwidth_3r_2c_1, verheight_3r_2c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_5,vertop_3r_2c_5, verwidth_3r_2c_1, verheight_3r_2c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft2_6,vertop_3r_2c_6, verwidth_3r_2c_1, verheight_3r_2c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //map road 3 row 3 column
    //horizontally map design code
    
    CGFloat herleft_3r_3c_1 = (screenRect.size.width*2.10);
    CGFloat herleft_3r_3c_2 = (screenRect.size.width*1.995);
    CGFloat herleft_3r_3c_3 = (screenRect.size.width*2.35);
    CGFloat herleft_3r_3c_4 = (screenRect.size.width*1.995);
    CGFloat herleft_3r_3c_5 = (screenRect.size.width*2.22);
    CGFloat herleft_3r_3c_6 = (screenRect.size.width*1.995);
    CGFloat herleft_3r_3c_7 = (screenRect.size.width*1.995);
    CGFloat herleft_3r_3c_8 = (screenRect.size.width*2.25);
    
    
    CGFloat herwidth_3r_3c_1 = (screenRect.size.width*0.81);
    CGFloat herwidth_3r_3c_2 = (screenRect.size.width*0.43);
    CGFloat herwidth_3r_3c_3 = (screenRect.size.width*0.46);
    CGFloat herwidth_3r_3c_4 = (screenRect.size.width*0.76);
    CGFloat herwidth_3r_3c_5 = (screenRect.size.width*0.79);
    CGFloat herwidth_3r_3c_6 = (screenRect.size.width*0.81);
    CGFloat herwidth_3r_3c_7 = (screenRect.size.width*0.28);
    CGFloat herwidth_3r_3c_8 = (screenRect.size.width*0.75);
    
    for (int count=0; count<8; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_1,hertop_3r_1c_1, herwidth_3r_3c_1, herheight1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_2,hertop_3r_1c_2, herwidth_3r_3c_2, herheight1)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_3,hertop_3r_1c_3, herwidth_3r_3c_3, herheight1)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_4,hertop_3r_1c_4, herwidth_3r_3c_4, herheight1)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_5,hertop_3r_1c_5, herwidth_3r_3c_5, herheight1)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_6,hertop_3r_1c_6, herwidth_3r_3c_6, herheight1)];
        
        if(count==6)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_7,hertop_3r_1c_7, herwidth_3r_3c_7, herheight1)];
        
        if(count==7)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(herleft_3r_3c_8,hertop_3r_1c_8, herwidth_3r_3c_8, herheight1)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    
    //vertically map design code
    
    CGFloat vertop_3r_3c_1 = (screenRect.size.height*2.10);
    CGFloat vertop_3r_3c_2 = (screenRect.size.height*2.75);
    CGFloat vertop_3r_3c_3 = (screenRect.size.height*2.22);
    CGFloat vertop_3r_3c_4 = (screenRect.size.height*1.995);
    
    
    CGFloat verwidth_3r_3c_1 = (screenRect.size.width*4)/100;
    
    CGFloat verheight_3r_3c_1 = (screenRect.size.height*0.76);
    CGFloat verheight_3r_3c_2 = (screenRect.size.height*0.16);
    CGFloat verheight_3r_3c_3 = (screenRect.size.height*0.78);
    CGFloat verheight_3r_3c_4 = (screenRect.size.height*0.36);
    CGFloat verheight_3r_3c_5 = (screenRect.size.height*0.90);
    CGFloat verheight_3r_3c_6 = (screenRect.size.height*0.51);
    
    
    for (int count=0; count<6; count++) {
        if(count==0)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_1,vertop_3r_3c_1, verwidth_3r_3c_1, verheight_3r_3c_1)];
        
        if(count==1)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_2,vertop_3r_3c_2, verwidth_3r_3c_1, verheight_3r_3c_2)];
        
        if(count==2)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_3,vertop_3r_3c_3, verwidth_3r_3c_1, verheight_3r_3c_3)];
        
        if(count==3)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_4,vertop_3r_3c_4, verwidth_3r_3c_1, verheight_3r_3c_4)];
        
        if(count==4)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_5,vertop_3r_3c_1, verwidth_3r_3c_1, verheight_3r_3c_5)];
        
        if(count==5)
            roadView=[[UIView alloc]initWithFrame:CGRectMake(verleft_1r_3c_6,vertop_3r_3c_4, verwidth_3r_3c_1, verheight_3r_3c_6)];
        
        [roadView setBackgroundColor:[UIColor whiteColor]];
        [self.mainscrollview addSubview:roadView];
    }
    UIFont *customFont = [UIFont fontWithName:@"Hobo" size:screenRect.size.width*0.035];
    UIFont *customFontd = [UIFont fontWithName:@"Hobo" size:screenRect.size.width*0.03];

    UIFont *customFontbig = [UIFont fontWithName:@"Hobo" size:screenRect.size.width*0.07];
    CGFloat namewidth=screenRect.size.width*0.07;
    CGFloat namewidth1=screenRect.size.height*0.15;
    CGFloat namewidth2=screenRect.size.height*0.55;

    titleName=[[UILabel alloc]initWithFrame:CGRectMake(screenRect.size.width*0.35,11, 200,35)];
    titleName.font=[UIFont fontWithName:@"Hobo" size:30.0];
    titleName.text=@"REGENTS PARK";
    titleName.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:titleName];
    
    
    maryNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*0.40), 300,namewidth)];
    maryNameLbl.font = customFontbig;
    maryNameLbl.text=@"M A R Y L E B O N E";
    maryNameLbl.textColor=[UIColor blackColor];
    [maryNameLbl sizeToFit];
    [self.mainscrollview addSubview:maryNameLbl];
    
    maryroadNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.23),(screenRect.size.height*0.21), 120,namewidth)];
    maryroadNameLbl.font = customFont;
    maryroadNameLbl.text=@"Marylebone  Road";
    maryroadNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:maryroadNameLbl];
    
    paddingNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.16),(screenRect.size.height*0.29), 150,namewidth)];
    paddingNameLbl.font = customFont;
    paddingNameLbl.text=@"Paddington  Street";
    paddingNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:paddingNameLbl];
    
    edgwareNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*0.49), 120,namewidth)];
    edgwareNameLbl.font = customFont;
    edgwareNameLbl.text=@"Edgware  Road";
    edgwareNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:edgwareNameLbl];
    
    bakerNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.76),(screenRect.size.height*0.25), 20,namewidth2)];
    bakerNameLbl.font = customFontd;
    bakerNameLbl.text=@"B\na\nk\ne\nr\n\nS\nt\nr\ne\ne\nt";
    bakerNameLbl.lineBreakMode = UILineBreakModeWordWrap;
    bakerNameLbl.numberOfLines = 0;
    [bakerNameLbl sizeToFit];
    bakerNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:bakerNameLbl];
    
    gioucesterNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.51),(screenRect.size.height*0.55), 20,namewidth2)];
    gioucesterNameLbl.font = customFontd;
    gioucesterNameLbl.text=@"G\nl\no\nu\nc\ne\ns\nt\ne\nr\n\nP\nl\na\nc\ne";
    gioucesterNameLbl.numberOfLines = 0;
    [gioucesterNameLbl sizeToFit];
    gioucesterNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:gioucesterNameLbl];
    
    hydeparkNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.15),(screenRect.size.height*0.90), 80,namewidth1)];
    hydeparkNameLbl.font = customFontbig;
    hydeparkNameLbl.text=@"HYDE\nPARK";
    hydeparkNameLbl.numberOfLines = 0;
    hydeparkNameLbl.textColor=[UIColor blackColor];
    //[self.mainscrollview addSubview:hydeparkNameLbl];
    
    
    signalBtn1=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.42),(screenRect.size.height*0.26), 17,17)];
    [signalBtn1 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn1];
    
    signalBtn2=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*0.465), 17,17)];
    [signalBtn2 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn2];
    
    signalBtn3=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.28),(screenRect.size.height*0.525), 17,17)];
    [signalBtn3 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn3];
    
    signalBtn4=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.82),(screenRect.size.height*0.35), 17,17)];
    [signalBtn4 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn4];
    
    hydeparkNameLbl1=[[UILabel alloc]initWithFrame:CGRectMake(7,(screenRect.size.height*1.10), 25,namewidth2+100)];
    hydeparkNameLbl1.font = customFontbig;
    hydeparkNameLbl1.text=@"H\nY\nD\nE\n\nP\nA \nR \nK";
    hydeparkNameLbl1.textColor=[UIColor blackColor];
    hydeparkNameLbl1.numberOfLines = 0;
    [hydeparkNameLbl1 sizeToFit];
    [self.mainscrollview addSubview:hydeparkNameLbl1];
    
    marleboneyNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.91),(screenRect.size.height*0.77), 20,namewidth2)];
    marleboneyNameLbl.font = customFontd;
    marleboneyNameLbl.text=@"M\na\nr\ny\nl\ne\nb\no\nn\ne\n\nH\ni\ng\nh\n\nS\nt\nr\ne\ne\nt";
    marleboneyNameLbl.numberOfLines = 0;
    [marleboneyNameLbl sizeToFit];
    marleboneyNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:marleboneyNameLbl];
    
    bondstreetNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*1.21), 120,namewidth)];
    bondstreetNameLbl.font = customFont;
    bondstreetNameLbl.text=@"Bond  Street";
    bondstreetNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:bondstreetNameLbl];
    
    grosvenorstreetNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.35),(screenRect.size.height*1.29), 120,namewidth)];
    grosvenorstreetNameLbl.font = customFont;
    grosvenorstreetNameLbl.text=@"Grosvenor  Street";
    grosvenorstreetNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:grosvenorstreetNameLbl];
    
    newbondNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.76),(screenRect.size.height*1.25), 20,namewidth2)];
    newbondNameLbl.font = customFontd;
    newbondNameLbl.numberOfLines = 0;
    newbondNameLbl.text=@"N\ne\nw\n\nB\no\nn\nd\n\nS\nt\nr\ne\ne\nt";
    newbondNameLbl.textColor=[UIColor blackColor];
    [newbondNameLbl sizeToFit];
    [self.mainscrollview addSubview:newbondNameLbl];
    
    berkeleyNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*1.52), 100,namewidth1)];
    berkeleyNameLbl.font = [UIFont fontWithName:@"Hobo" size:22];
    berkeleyNameLbl.numberOfLines = 0;
    berkeleyNameLbl.text=@"Berkeley\nSquare";
    berkeleyNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:berkeleyNameLbl];
    
    stratonstreetNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.26),(screenRect.size.height*1.67), 17,namewidth2)];
    stratonstreetNameLbl.font = customFontd;
    stratonstreetNameLbl.numberOfLines = 0;
    stratonstreetNameLbl.text=@"S\nt\nr\na\nt\nt\no\nn\n\nS\nt\nr\ne\ne\nt";
    stratonstreetNameLbl.textColor=[UIColor blackColor];
    [stratonstreetNameLbl sizeToFit];
    [self.mainscrollview addSubview:stratonstreetNameLbl];
    
    berkeleystreetNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.51),(screenRect.size.height*1.67), 17,namewidth2)];
    berkeleystreetNameLbl.font = customFontd;
    berkeleystreetNameLbl.numberOfLines = 0;
    berkeleystreetNameLbl.text=@"B\ne\nr\nk\ne\nl\ne\ny\n\nS\nt\nr\ne\ne\nt";
    berkeleystreetNameLbl.textColor=[UIColor blackColor];
    [berkeleystreetNameLbl sizeToFit];
    [self.mainscrollview addSubview:berkeleystreetNameLbl];
    
    piccadillyNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.60),(screenRect.size.height*1.74), 120,namewidth)];
    piccadillyNameLbl.font = customFont;
    piccadillyNameLbl.text=@"Piccadilly";
    piccadillyNameLbl.textColor=[UIColor blackColor];
    //[self.mainscrollview addSubview:piccadillyNameLbl];
    
    mayfairNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*1.44), 230,namewidth+10)];
    mayfairNameLbl.font = customFontbig;
    mayfairNameLbl.text=@"M A Y F A I R";
    mayfairNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:mayfairNameLbl];
    
    greenparkNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.35),(screenRect.size.height*2), 250,namewidth+10)];
    greenparkNameLbl.font = [UIFont fontWithName:@"Hobo" size:22];
    greenparkNameLbl.text=@"GREEN  PARK";
    greenparkNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:greenparkNameLbl];
    
    signalBtn5=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.15),(screenRect.size.height*1.245), 17,17)];
    [signalBtn5 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn5];
    
    signalBtn6=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.42),(screenRect.size.height*1.245), 17,17)];
    [signalBtn6 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn6];
    
    signalBtn7=[[UIButton alloc]initWithFrame:CGRectMake(12,(screenRect.size.height*1.85), 17,17)];
    [signalBtn7 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn7];
    
    signalBtn8=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.50),(screenRect.size.height*1.93), 17,17)];
    [signalBtn8 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn8];
    
    knighsNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.29),(screenRect.size.height*2.09), 150,namewidth)];
    knighsNameLbl.font = customFont;
    knighsNameLbl.text=@"Knightsbridge";
    knighsNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:knighsNameLbl];
    
    queenNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.26),(screenRect.size.height*2.12), 17,namewidth2)];
    queenNameLbl.font = customFontd;
    queenNameLbl.numberOfLines = 0;
    queenNameLbl.text=@"Q\nu\ne\ne\nn\n's\n\nG\na\nt\ne";
    queenNameLbl.textColor=[UIColor blackColor];
    [queenNameLbl sizeToFit];
    [self.mainscrollview addSubview:queenNameLbl];
    
    bromptNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.76),(screenRect.size.height*2.25), 17,namewidth2)];
    bromptNameLbl.font = customFontd;
    bromptNameLbl.numberOfLines = 0;
    bromptNameLbl.text=@"B\nr\no\nm\np\nt\no\nn\n\nR\no\na\nd";
    bromptNameLbl.textColor=[UIColor blackColor];
    [bromptNameLbl sizeToFit];
    [self.mainscrollview addSubview:bromptNameLbl];
    
    slonneNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.91),(screenRect.size.height*2.34), 17,namewidth2)];
    slonneNameLbl.font = customFontd;
    slonneNameLbl.numberOfLines = 0;
    slonneNameLbl.text=@"S\nl\no\na\nn\ne\n\n\nS\nt\nr\ne\ne\nt";
    slonneNameLbl.textColor=[UIColor blackColor];
    [slonneNameLbl sizeToFit];
    [self.mainscrollview addSubview:slonneNameLbl];
    
    thurloeNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.25),(screenRect.size.height*2.49), 150,namewidth)];
    thurloeNameLbl.font = customFont;
    thurloeNameLbl.text=@"Thurloe  Place";
    thurloeNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:thurloeNameLbl];
    
    gloucesterNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.11),(screenRect.size.height*2.53), 17,namewidth2)];
    gloucesterNameLbl.font = customFontd;
    gloucesterNameLbl.numberOfLines = 0;
    gloucesterNameLbl.text=@"G\nl\no\nu\nc\ne\ns\nt\ne\nr\n\nR\no\na\nd";
    gloucesterNameLbl.textColor=[UIColor blackColor];
    [gloucesterNameLbl sizeToFit];
    [self.mainscrollview addSubview:gloucesterNameLbl];
    
    kingsNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.62),(screenRect.size.height*2.74), 150,namewidth)];
    kingsNameLbl.font = customFont;
    kingsNameLbl.text=@"King's  Road";
    kingsNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:kingsNameLbl];
    
    chelseaNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.55),(screenRect.size.height*2.89), 150,namewidth)];
    chelseaNameLbl.font = customFont;
    chelseaNameLbl.text=@"Chelsea  Embankment";
    chelseaNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:chelseaNameLbl];
    
    southNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.20),(screenRect.size.height*2.62), 900,namewidth1)];
    southNameLbl.font = customFontbig;
    southNameLbl.text=@"S O U T H\nK E N S I N G T O N";
    southNameLbl.textColor=[UIColor blackColor];
    southNameLbl.numberOfLines = 0;
    [self.mainscrollview addSubview:southNameLbl];
    
    signalBtn9=[[UIButton alloc]initWithFrame:CGRectMake(12,(screenRect.size.height*2.47), 17,17)];
    [signalBtn9 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn9];
    
    signalBtn10=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.30),(screenRect.size.height*2.45), 17,17)];
    [signalBtn10 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn10];
    
    signalBtn11=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*0.96),(screenRect.size.height*2.775), 17,17)];
    [signalBtn11 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn11];
    
    eustonNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.25),(screenRect.size.height*0.21), 150,namewidth)];
    eustonNameLbl.font = customFont;
    eustonNameLbl.text=@"Euston  Square";
    eustonNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:eustonNameLbl];
    
    gowerNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.76),(screenRect.size.height*0.24), 17,namewidth2)];
    gowerNameLbl.font = customFontd;
    gowerNameLbl.text=@"G\no\nw\ne\nr\n\n\nS\nt\nr\ne\ne\nt";
    gowerNameLbl.textColor=[UIColor blackColor];
    gowerNameLbl.numberOfLines = 0;
    [gowerNameLbl sizeToFit];
    [self.mainscrollview addSubview:gowerNameLbl];
    
    bloomsburyNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.40),(screenRect.size.height*0.40), 380,namewidth+10)];
    bloomsburyNameLbl.font = customFontbig;
    bloomsburyNameLbl.text=@"B L O O M S B U R Y";
    bloomsburyNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:bloomsburyNameLbl];
    
    goodgeNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.14),(screenRect.size.height*0.49), 350,namewidth)];
    goodgeNameLbl.font = customFont;
    goodgeNameLbl.text=@"Goodge  Street";
    goodgeNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:goodgeNameLbl];
    
    russelNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.91),(screenRect.size.height*0.48), 17,namewidth2)];
    russelNameLbl.font = customFontd;
    russelNameLbl.text=@"R\nu\ns\ns\ne\nl\nl\n\nS\nq\nu\na\nr\ne";
    russelNameLbl.textColor=[UIColor blackColor];
    russelNameLbl.numberOfLines = 0;
    [russelNameLbl sizeToFit];
    [self.mainscrollview addSubview:russelNameLbl];
    
    tottennamNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.51),(screenRect.size.height*0.55), 20,namewidth2)];
    tottennamNameLbl.font = customFontd;
    tottennamNameLbl.text=@"T\no\nt\nt\ne\nn\nh\na\nm\n\nC\no\nu\nr\nt\n\nR\no\na\nd";
    tottennamNameLbl.textColor=[UIColor blackColor];
    tottennamNameLbl.numberOfLines = 0;
    [tottennamNameLbl sizeToFit];
    [self.mainscrollview addSubview:tottennamNameLbl];
    
    signalBtn12=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.27),(screenRect.size.height*0.13), 17,17)];
    [signalBtn12 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn12];
    
    signalBtn13=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.42),(screenRect.size.height*0.53), 17,17)];
    [signalBtn13 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn13];
    
    UIButton* signalBtn13_=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.55),(screenRect.size.height*0.78), 17,17)];
    [signalBtn13_ setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn13_];
    
    signalBtn14=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.55),(screenRect.size.height*0.25), 17,17)];
    [signalBtn14 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn14];
    
    UIButton* signalBtn14_=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.69),(screenRect.size.height*0.25), 17,17)];
    [signalBtn14_ setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn14_];
    
    UIButton* signalBtn15_=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2),(screenRect.size.height*0.70), 17,17)];
    [signalBtn15_ setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn15_];
    
    bloomsburyStreetNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.76),(screenRect.size.height*0.86), 20,namewidth2)];
    bloomsburyStreetNameLbl.font = customFontd;
    bloomsburyStreetNameLbl.text=@"B\nl\no\no\nm\ns\nb\nu\nr\ny\n\nS\nt\nr\ne\ne\nt";
    bloomsburyStreetNameLbl.textColor=[UIColor blackColor];
    bloomsburyStreetNameLbl.numberOfLines = 0;
    [bloomsburyStreetNameLbl sizeToFit];
    [self.mainscrollview addSubview:bloomsburyStreetNameLbl];
    
    signalBtn18=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.55),(screenRect.size.height*1.25), 17,17)];
    [signalBtn18 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn18];
    
    signalBtn19=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.55),(screenRect.size.height*1.71), 17,17)];
    [signalBtn19 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn19];
    
    signalBtn20=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.98),(screenRect.size.height*1.71), 17,17)];
    [signalBtn20 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn20];
    
    oxfordNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.15),(screenRect.size.height*1.21), 150,namewidth)];
    oxfordNameLbl.font = customFont;
    oxfordNameLbl.text=@"Oxford  Street";
    oxfordNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:oxfordNameLbl];
    
    sohoNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.55),(screenRect.size.height*1.30), 100,namewidth+10)];
    sohoNameLbl.font =customFontbig;
    sohoNameLbl.text=@"S O H O";
    sohoNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:sohoNameLbl];
    
    regentNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.51),(screenRect.size.height*1.40), 20,namewidth2)];
    regentNameLbl.font = customFontd;
    regentNameLbl.text=@"R\ne\ng\ne\nn\nt\n\nS\nt\nr\ne\ne\nt";
    regentNameLbl.textColor=[UIColor blackColor];
    regentNameLbl.numberOfLines = 0;
    [regentNameLbl sizeToFit];
    [self.mainscrollview addSubview:regentNameLbl];
    
    UILabel*  charingNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.91),(screenRect.size.height*1.25), 20,namewidth2)];
    charingNameLbl.font = customFontd;
    charingNameLbl.text=@"C\nh\na\nr\ni\nn\ng\n\nC\nr\no\ns\ns\n\nR\no\na\nd";
    charingNameLbl.textColor=[UIColor blackColor];
    charingNameLbl.numberOfLines = 0;
    [charingNameLbl sizeToFit];
    [self.mainscrollview addSubview:charingNameLbl];
    
    shaffesburyNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.76),(screenRect.size.height*1.40), 20,namewidth2)];
    shaffesburyNameLbl.font = customFontd;
    shaffesburyNameLbl.text=@"S\nh\na\nf\nf\ne\ns\nb\nu\nr\ny\n\nA\nV\ne\nn\nu\ne";
    shaffesburyNameLbl.textColor=[UIColor blackColor];
    shaffesburyNameLbl.numberOfLines = 0;
    [shaffesburyNameLbl sizeToFit];
    [self.mainscrollview addSubview:shaffesburyNameLbl];
    
    piccadilly1NameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.54),(screenRect.size.height*1.74), 100,namewidth)];
    piccadilly1NameLbl.font = customFont;
    piccadilly1NameLbl.text=@"Piccadilly";
    piccadilly1NameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:piccadilly1NameLbl];
    
    signalBtn21=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.51),(screenRect.size.height*2.07), 17,17)];
    [signalBtn21 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn21];
    
    signalBtn22=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*1.80),(screenRect.size.height*2.36), 17,17)];
    [signalBtn22 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn22];
    
    belgraviaNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.22),(screenRect.size.height*2.35), 350,namewidth)];
    belgraviaNameLbl.font = customFontbig;
    belgraviaNameLbl.text=@"B E L G R A V I A";
    belgraviaNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:belgraviaNameLbl];
    
    cadoganNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.11),(screenRect.size.height*2.50), 20,namewidth2)];
    cadoganNameLbl.font = customFontd;
    cadoganNameLbl.text=@"C\na\nd\no\ng\na\nn\n\nP\nl\na\nc\ne";
    cadoganNameLbl.textColor=[UIColor blackColor];
    cadoganNameLbl.numberOfLines = 0;
    [cadoganNameLbl sizeToFit];
    [self.mainscrollview addSubview:cadoganNameLbl];
    
    eatonNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.36),(screenRect.size.height*2.36), 20,namewidth2)];
    eatonNameLbl.font = customFontd;
    eatonNameLbl.text=@"E\na\nt\no\nn\n\nS\nq\nu\na\nr\ne";
    eatonNameLbl.textColor=[UIColor blackColor];
    eatonNameLbl.numberOfLines = 0;
    [eatonNameLbl sizeToFit];
    [self.mainscrollview addSubview:eatonNameLbl];
    
    grosvenerNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.76),(screenRect.size.height*2.24), 20,namewidth2)];
    grosvenerNameLbl.font = customFontd;
    grosvenerNameLbl.text=@"G\nr\no\ns\nv\ne\nn\nO\nr\n\nP\nl\na\nc\ne";
    grosvenerNameLbl.textColor=[UIColor blackColor];
    grosvenerNameLbl.numberOfLines = 0;
    [grosvenerNameLbl sizeToFit];
    [self.mainscrollview addSubview:grosvenerNameLbl];
    
    ecclestenNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.91),(screenRect.size.height*2.35), 20,namewidth2)];
    ecclestenNameLbl.font = customFontd;
    ecclestenNameLbl.text=@"E\nc\nc\nl\ne\ns\nt\nO\nn\n\nS\nt\nr\ne\ne\nt";
    ecclestenNameLbl.textColor=[UIColor blackColor];
    ecclestenNameLbl.numberOfLines = 0;
    [ecclestenNameLbl sizeToFit];
    [self.mainscrollview addSubview:ecclestenNameLbl];
    
    buckinghamNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.51),(screenRect.size.height*2.55), 20,namewidth2)];
    buckinghamNameLbl.font = customFontd;
    buckinghamNameLbl.text=@"B\nu\nc\nk\ni\nn\ng\nh\na\nm\n\nP\nl\na\nc\ne\n\nR\no\na\nd";
    buckinghamNameLbl.textColor=[UIColor blackColor];
    buckinghamNameLbl.numberOfLines = 0;
    [buckinghamNameLbl sizeToFit];
    [self.mainscrollview addSubview:buckinghamNameLbl];
    
    belgraveNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*1.55),(screenRect.size.height*2.64), 100,namewidth)];
    belgraveNameLbl.font = customFont;
    belgraveNameLbl.text=@"Belgrave  Road";
    belgraveNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:belgraveNameLbl];
    
    signalBtn23=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2.20),(screenRect.size.height*0.18), 17,17)];
    [signalBtn23 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn23];
    
    signalBtn24=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2.80),(screenRect.size.height*0.18), 17,17)];
    [signalBtn24 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn24];
    
    gowersNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.60),(screenRect.size.height*0.215), 100,23)];
    gowersNameLbl.font = customFont;
    gowersNameLbl.text=@"King's  Cross";
    gowersNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:gowersNameLbl];
    
   UILabel* argylesquare=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.76),(screenRect.size.height*0.25), 20,namewidth2)];
    argylesquare.font = customFontd;
    argylesquare.text=@"A\nr\ng\ny\nl\ne\n\nS\nq\nu\na\nr\ne";
    argylesquare.textColor=[UIColor blackColor];
    argylesquare.numberOfLines = 0;
    [argylesquare sizeToFit];
    [self.mainscrollview addSubview:argylesquare];

    
    juddNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.51),(screenRect.size.height*0.60), 20,namewidth2)];
    juddNameLbl.font = customFontd;
    juddNameLbl.text=@"J\nu\nd\nd\n\nS\nt\nr\ne\ne\nt";
    juddNameLbl.textColor=[UIColor blackColor];
    juddNameLbl.numberOfLines = 0;
    [juddNameLbl sizeToFit];
    [self.mainscrollview addSubview:juddNameLbl];
    
    graysNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.91),(screenRect.size.height*0.30), 20,namewidth2)];
    graysNameLbl.font = customFontd;
    graysNameLbl.text=@"G\nr\na\ny\n's\n\nI\nn\nn\n\nR\no\na\nd";
    graysNameLbl.textColor=[UIColor blackColor];
    graysNameLbl.numberOfLines = 0;
    [graysNameLbl sizeToFit];
    [self.mainscrollview addSubview:graysNameLbl];
    
    theobaldsNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.35),(screenRect.size.height*0.49), 100,namewidth)];
    theobaldsNameLbl.font = customFont;
    theobaldsNameLbl.text=@"Theobald's  Road";
    theobaldsNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:theobaldsNameLbl];
    
    southampNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.11),(screenRect.size.height*0.65), 20,namewidth2)];
    southampNameLbl.font = customFontd;
    southampNameLbl.text=@"S\no\nu\nt\nh\na\nm\np\nt\no\nn\n\nR\no\nw";
    southampNameLbl.textColor=[UIColor blackColor];
    southampNameLbl.numberOfLines = 0;
    [southampNameLbl sizeToFit];
    [self.mainscrollview addSubview:southampNameLbl];
    
    highholbornNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.60),(screenRect.size.height*0.74), 100,namewidth)];
    highholbornNameLbl.font = customFont;
    highholbornNameLbl.text=@"High  Holborn";
    highholbornNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:highholbornNameLbl];
    
    holbornNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.55),(screenRect.size.height*0.66), 250,namewidth+10)];
    holbornNameLbl.font = customFontbig;
    holbornNameLbl.text=@"H O L B O R N";
    holbornNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:holbornNameLbl];
    
    signalBtn25=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2.50),(screenRect.size.height*1.06), 17,17)];
    [signalBtn25 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn25];
    
    signalBtn26=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2.23),(screenRect.size.height*1.45), 17,17)];
    [signalBtn26 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn26];
    
    signalBtn27=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2.81),(screenRect.size.height*1.60), 17,17)];
    [signalBtn27 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn27];
    
    signalBtn28=[[UIButton alloc]initWithFrame:CGRectMake((screenRect.size.width*2.80),(screenRect.size.height*2.06), 17,17)];
    [signalBtn28 setImage:[UIImage imageNamed:@"underground-symbol-small.gif"] forState:UIControlStateNormal];
    [self.mainscrollview addSubview:signalBtn28];
    
    longNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.25),(screenRect.size.height*1.09), 100,namewidth)];
    longNameLbl.font = customFont;
    longNameLbl.text=@"Long  Acre";
    longNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:longNameLbl];
    
    kingswayNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.40),(screenRect.size.height*1.29), 100,namewidth)];
    kingswayNameLbl.font = customFont;
    kingswayNameLbl.text=@"Kingsway";
    kingswayNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:kingswayNameLbl];
    
    UILabel* strand=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.76),(screenRect.size.height*1.35), 20,namewidth2)];
    strand.font = customFontd;
    strand.text=@"S\nt\nr\na\nn\nd";
    strand.textColor=[UIColor blackColor];
    strand.numberOfLines = 0;
    [strand sizeToFit];
    [self.mainscrollview addSubview:strand];

    stNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.11),(screenRect.size.height*1.16), 20,namewidth2)];
    stNameLbl.font = customFontd;
    stNameLbl.text=@"S\nt\n\nM\na\nr\nt\ni\nn\n's\n\nL\na\nn\ne";
    stNameLbl.textColor=[UIColor blackColor];
    stNameLbl.numberOfLines = 0;
    [stNameLbl sizeToFit];
    [self.mainscrollview addSubview:stNameLbl];
    
    coventNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.17),(screenRect.size.height*1.30), 790,namewidth1)];
    coventNameLbl.font = customFontbig;
    coventNameLbl.text=@"C O V E N T\nG A R D E N";
    coventNameLbl.textColor=[UIColor blackColor];
    coventNameLbl.numberOfLines = 0;
    [self.mainscrollview addSubview:coventNameLbl];
    
    aldwychNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.45),(screenRect.size.height*1.49), 100,namewidth)];
    aldwychNameLbl.font = customFont;
    aldwychNameLbl.text=@"Aidwych";
    aldwychNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:aldwychNameLbl];
    
    whiteNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.51),(screenRect.size.height*1.54), 17,namewidth2)];
    whiteNameLbl.font = customFontd;
    whiteNameLbl.text=@"W\nh\ni\nt\ne\nh\na\nl\nl";
    whiteNameLbl.numberOfLines = 0;
    [whiteNameLbl sizeToFit];
    whiteNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:whiteNameLbl];
    
    victoryaNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.91),(screenRect.size.height*1.58), 20,namewidth2)];
    victoryaNameLbl.font = customFontd;
    victoryaNameLbl.text=@"V\ni\nc\nt\no\nr\ni\na\n\nE\nm\nb\na\nn\nk\nm\ne\nn\nt";
    victoryaNameLbl.textColor=[UIColor blackColor];
    victoryaNameLbl.numberOfLines = 0;
    [victoryaNameLbl sizeToFit];
    [self.mainscrollview addSubview:victoryaNameLbl];
    
    parliamentNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.29),(screenRect.size.height*1.89), 200,namewidth)];
    parliamentNameLbl.font = customFont;
    parliamentNameLbl.text=@"Parliament  Street";
    parliamentNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:parliamentNameLbl];
    
    victoriaNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.55),(screenRect.size.height*2.09), 100,namewidth)];
    victoriaNameLbl.font = customFont;
    victoriaNameLbl.text=@"Victoria  Street";
    victoriaNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:victoriaNameLbl];
    
    westNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.25),(screenRect.size.height*2.15), 380,namewidth+10)];
    westNameLbl.font = customFontbig;
    westNameLbl.text=@"W E S T M I N S T E R";
    westNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:westNameLbl];
    
    buckkingNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.0),(screenRect.size.height*2.21), 100,namewidth)];
    buckkingNameLbl.font = customFont;
    buckkingNameLbl.text=@"Buckingham  Gate";
    buckkingNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:buckkingNameLbl];
    
    marshamNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.76),(screenRect.size.height*2.24), 20,namewidth2)];
    marshamNameLbl.font = customFontd;
    marshamNameLbl.text=@"M\na\nr\ns\nh\na\nm\n\nS\nt\nr\ne\ne\nt";
    marshamNameLbl.textColor=[UIColor blackColor];
    marshamNameLbl.numberOfLines = 0;
    [marshamNameLbl sizeToFit];
    [self.mainscrollview addSubview:marshamNameLbl];
    
    millbankNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.91),(screenRect.size.height*2.24), 20,namewidth2)];
    millbankNameLbl.font = customFontd;
    millbankNameLbl.text=@"M\ni\nl\nl\nb\na\nn\nk";
    millbankNameLbl.textColor=[UIColor blackColor];
    millbankNameLbl.numberOfLines = 0;
    [millbankNameLbl sizeToFit];
    [self.mainscrollview addSubview:millbankNameLbl];
    
    greatNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.40),(screenRect.size.height*2.39), 200,namewidth)];
    greatNameLbl.font = customFont;
    greatNameLbl.text=@"Great  Peter  Street";
    greatNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:greatNameLbl];
    
    horebwrryNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.26),(screenRect.size.height*2.49), 100,namewidth)];
    horebwrryNameLbl.font = customFont;
    horebwrryNameLbl.text=@"Horeberry  Road";
    horebwrryNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:horebwrryNameLbl];
    
    rochNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.11),(screenRect.size.height*2.54), 20,namewidth2)];
    rochNameLbl.font = customFontd;
    rochNameLbl.text=@"R\no\nc\nh\ne\ns\nf\ne\nr\n\nR\no\nw";
    rochNameLbl.textColor=[UIColor blackColor];
    rochNameLbl.numberOfLines = 0;
    [rochNameLbl sizeToFit];
    [self.mainscrollview addSubview:rochNameLbl];
    
    vauxhallNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.50),(screenRect.size.height*2.89), 150,namewidth)];
    vauxhallNameLbl.font = customFont;
    vauxhallNameLbl.text=@"Vauxhall  Bridge  Road";
    vauxhallNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:vauxhallNameLbl];
    
    UILabel* riverNameLbl=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*3.02),(screenRect.size.height*1.50), 900,namewidth1)];
    riverNameLbl.font = customFontbig;
    riverNameLbl.text=@"R I V E R\nT H A M E S";
    riverNameLbl.numberOfLines = 0;
    riverNameLbl.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:riverNameLbl];
    
    UILabel* riverNameLbl1=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*2.30),(screenRect.size.height*3.10), 330,namewidth+10)];
    riverNameLbl1.font = customFontbig;
    riverNameLbl1.text=@"R I V E R   T H A M E S";
    riverNameLbl1.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:riverNameLbl1];
    
    UILabel* riverNameLbl2=[[UILabel alloc]initWithFrame:CGRectMake((screenRect.size.width*0.30),(screenRect.size.height*3.10), 330,namewidth+10)];
    riverNameLbl2.font = customFontbig;
    riverNameLbl2.text=@"R I V E R   T H A M E S";
    riverNameLbl2.textColor=[UIColor blackColor];
    [self.mainscrollview addSubview:riverNameLbl2];
    
    BOB_T0P_MARGIN = 1.48;
    BOB_LEFT_MARGIN = 1.48;

    bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    [bobImg setImage:[UIImage imageNamed:@"bobimage.png"]];
    //[self.mainscrollview addSubview:bobImg];
    
    simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    [simamImg setImage:[UIImage imageNamed:@"simamimage.png"]];
    [self.mainscrollview addSubview:simamImg];
    
    [mainscrollview setContentOffset:CGPointMake(ywidth,yheights) animated:YES];
    mainscrollview.contentSize = CGSizeMake(screenRect.size.width*4.0,screenRect.size.height*4.0);
    mainscrollview.scrollEnabled=NO;
    
    isMovingUp=YES;
    indexvalue=0;
    indexvlaueRedimg=8;
    indexvalueRedimgCompa=0;
    imageIndex=0;
    marginVO=[[MarginVO alloc]init];
    
    
        timer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(RunnerAction) userInfo:nil repeats: YES];
}
-(void)pauseAction{
    
    if (!isPause) {
								isPause = true;
								Score_timeSwapBuff += Score_timeInMilliseconds;
								
    }
    
}
- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    STARTSEC = CURRENTSEC;
    bobSpeed=bobSpeed+1;
    vibrateCount=0;
  [self vibratePhone];
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        isMovingUp=NO;
        isMovingDown=NO;
        isMovingLeft=YES;
        isMovingRight=NO;
        isLeft_to_Right = false;
        isRight_to_Left = true;

        NSLog(@"Swipe Left");
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        isMovingUp=NO;
        isMovingRight=YES;
        isMovingDown=NO;
        isMovingLeft=NO;
        isLeft_to_Right = true;
        isRight_to_Left = false;

        NSLog(@"Swipe Right");
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        isMovingUp=YES;
        isMovingDown=NO;
        isMovingRight=NO;
        isMovingLeft=NO;
        isTop_to_Bottom = false;
        isBottom_to_Top = true;

        NSLog(@"Swipe Up");
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        isMovingUp=NO;
        isMovingRight=NO;
        isMovingLeft=NO;
        isMovingDown=YES;
        isTop_to_Bottom = true;
        isBottom_to_Top = false;

        NSLog(@"Swipe Down");
    }
}
- (void)vibratePhone;
{
    
    if(vibrateCount == 0) {
        vibrateCount=1;
        NSMutableDictionary* dict = [NSMutableDictionary dictionary];
        NSMutableArray* arr = [NSMutableArray array ];
        
        [arr addObject:[NSNumber numberWithBool:YES]]; //vibrate for 2000ms
        [arr addObject:[NSNumber numberWithInt:50]];
        [dict setObject:arr forKey:@"VibePattern"];
        [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
        
        
        AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
        //AudioServicesPlayAlertSound (1105);
    }else {
        
        //vibrated 5 times already kill timer and stop vibrating
        [vibrateTimer invalidate];
    }
    }
-(void)RunnerAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    Score_timeInMilliseconds = ([[NSDate date] timeIntervalSince1970]) - Score_startTime;
    //long diffinsec=Score_timeInMilliseconds*900;
    newscore=newscore+1;
    Score_updatedTime = Score_timeSwapBuff + Score_timeInMilliseconds;
    CURRENTSEC = Score_updatedTime;
    if (CURRENTSEC > STARTSEC + 1.5)
        isSimanMove = true;
    else
        isSimanMove = false;
    });
    if (isGAMEOVER==false && !isPause) {
        if (Score_updatedTime > redline) {
            redline = Score_updatedTime + 2.5;
        }
        
        if(newscore>Updatescoretime)
        {
            //score = (long) (Score_updatedTime * 0.005);
            score+=5;
            NSLog(@"score :-%ld",score);
            Updatescoretime+=25;
            CURRENT_SCORE = score;
            [scoreDisplyayLbl removeFromSuperview];
            scoreDisplyayLbl=[[UILabel alloc]initWithFrame:CGRectMake(60,10, 80,30)];
            scoreDisplyayLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
            scoreDisplyayLbl.textColor=[UIColor blackColor];
            scoreDisplyayLbl.text=[NSString stringWithFormat:@"%ld", score];
            [self.view addSubview:scoreDisplyayLbl];
            [self.view bringSubviewToFront:scoreDisplyayLbl];

        }
        
    CGFloat leftmargin = (CGFloat) ((screenRect.size.width) * BOB_LEFT_MARGIN);
    CGFloat topmargin = (CGFloat) ((screenRect.size.height) * BOB_T0P_MARGIN);
        [bobImg removeFromSuperview];

    if (isMovingUp==YES) {
        if(isLeft_to_Right)
            [self MoveUp:leftmargin :topmargin];
        else
           [self MoveUP_Right_to_Left:leftmargin: topmargin];

            BOB_T0P_MARGIN=BOB_T0P_MARGIN-0.003;
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights
                                                                , screenRect.size.height*0.05,screenRect.size.height*0.05)];
        [self MoveUpAnimation];
        
    }else if (isMovingLeft==YES) {
        if(isTop_to_Bottom)
           [self MoveLeft:leftmargin :topmargin];
        else
           [self MoveLeftDown_to_up:leftmargin :topmargin];

            BOB_LEFT_MARGIN=BOB_LEFT_MARGIN-0.005;
            //BOB_LEFT_MARGIN=BOB_LEFT_MARGIN-(screenRect.size.width*0.006);
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
            [self MoveLEFTAnimation ];
    }else if (isMovingRight==YES) {
           //BOB_LEFT_MARGIN=BOB_LEFT_MARGIN+(screenRect.size.width*0.006);
        if(isTop_to_Bottom)
            [self MoveRight:leftmargin:topmargin];
        else
            [self MoveRightDown_to_up:leftmargin: topmargin];

            BOB_LEFT_MARGIN=BOB_LEFT_MARGIN+0.005;

            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
        [self MoveRIGHTAnimation];
    }else if (isMovingDown==YES) {
        if(isLeft_to_Right)
        [self MoveDown:leftmargin: topmargin];
        else
            [self MoveDownRight_to_Left:leftmargin: topmargin];
        
            BOB_T0P_MARGIN=BOB_T0P_MARGIN+0.003;

            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
        [self MoveDOWNAnimation];
    }
        if (indexvlaueRedimg==indexvalueRedimgCompa) {
            //[self performSelectorOnMainThread:@selector(AddColorView) withObject:nil waitUntilDone:YES];
            //[NSThread detachNewThreadSelector:@selector(AddColorView) toTarget:self withObject:nil];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ [self AddColorView]; dispatch_async(dispatch_get_main_queue(), ^{     [self.mainscrollview addSubview:redcolor ];
  }); });
            
            indexvlaueRedimg=indexvlaueRedimg+18;
        }
        indexvalueRedimgCompa=indexvalueRedimgCompa+1;

    [bobImg setImage:[UIImage imageNamed:@"bobimage.png"]];
    [self.mainscrollview addSubview:bobImg];
        
        NSUInteger count = [repeatpointsDict count];
        if (count>=4) {
            NSLog(@"BOB_T0P_MARGIN %@",[NSString stringWithFormat: @"%.2f_right", BOB_T0P_MARGIN]);
            if([repeatpointsDict objectForKey:[NSString stringWithFormat: @"%.2f_right", BOB_T0P_MARGIN]]!=nil){
                marginVO=[[MarginVO alloc]init];
                marginVO=[repeatpointsDict objectForKey:[NSString stringWithFormat: @"%.2f_up", BOB_T0P_MARGIN]];
                
                float simanleftmargin =[marginVO.simLeftRight floatValue];
                float simantopmargin =[ marginVO.simTopDown floatValue];
                
                if (marginVO.isMovingUp) {
                    if (BOB_LEFT_MARGIN == simanleftmargin && ((BOB_T0P_MARGIN + 0.003) >= simantopmargin && (BOB_T0P_MARGIN - 0.003) <= simantopmargin)) {
                        isGAMEOVER = true;
                        [self pickImages];
                    }
                }
            }
            else if([repeatpointsDict objectForKey:[NSString stringWithFormat: @"%.2f_right", BOB_LEFT_MARGIN]]!=nil){
                marginVO=[[MarginVO alloc]init];
                marginVO=[repeatpointsDict objectForKey:[NSString stringWithFormat: @"%.2f_right", BOB_LEFT_MARGIN]];
                
                float simanleftmargin =[marginVO.simLeftRight floatValue];
                float simantopmargin =[ marginVO.simTopDown floatValue];
                if (((BOB_LEFT_MARGIN + 0.005) >= simanleftmargin && (BOB_LEFT_MARGIN - 0.005) <= simanleftmargin)
                    && BOB_T0P_MARGIN == simantopmargin) {
                    isGAMEOVER = true;
                    [self pickImages];
                }// end of else
                
            }
        }
    
        
        
    marginVO=[[MarginVO alloc]init];
    marginVO.simLeftRight=[[NSString alloc] init];
    marginVO.simTopDown=[[NSString alloc] init];
    marginVO.simLeftRight=[NSString stringWithFormat: @"%.2f", BOB_LEFT_MARGIN];
    marginVO.simTopDown=[NSString stringWithFormat: @"%.2f", BOB_T0P_MARGIN];
        
        if (isMovingUp || isMovingDown){
            [repeatpointsDict setValue:marginVO forKey:[NSString stringWithFormat: @"%.2f_up", BOB_T0P_MARGIN]];
            marginVO.isMovingUp = true;
        }
        else{
            [repeatpointsDict setValue:marginVO forKey:[NSString stringWithFormat: @"%.2f_right", BOB_LEFT_MARGIN]];
            marginVO.isMovingUp = false;
        }
        
        if (isMovingLeft || isMovingRight)
            marginVO.isMovingRight = true;
        else
            marginVO.isMovingRight = false;
        
        [simonArray addObject:marginVO];
    
    if (simonArray.count>=100 && isSimanMove) {
        if (indexvalue == simonArray.count - 2) {
            isGAMEOVER = true;
            
            [self pickImages];
								} else {
        [simamImg removeFromSuperview];
        marginVO=[[MarginVO alloc]init];
        marginVO=[simonArray objectAtIndex:indexvalue];
        SIMAN_T0P_MARGIN=(CGFloat)[marginVO.simTopDown floatValue];
        SIMAN_LEFT_MARGIN=(CGFloat)[marginVO.simLeftRight floatValue];
        
        simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(SIMAN_LEFT_MARGIN*ywidth,SIMAN_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
        [simamImg setImage:[UIImage imageNamed:@"simamimage.png"]];
        [self.mainscrollview addSubview:simamImg];
        indexvalue=indexvalue+2;
        
      }
    }
        
        /*NSUInteger count = [simonArray count];
        if (count>=4) {
            for (int k = 0; k < [simonArray count]-3; k++) {
                marginVO=[[MarginVO alloc]init];
                marginVO=[simonArray objectAtIndex:k];
                
                double simanleftmargin =[marginVO.simLeftRight floatValue];;
                double simantopmargin =[ marginVO.simTopDown floatValue];;
                
                // System.out.println("\n\n\n"+simanmarginList+"\n"+simanleftmargin+"\n"+simantopmargin);
                if (marginVO.isMovingUp) {
                    if (BOB_LEFT_MARGIN == simanleftmargin && ((BOB_T0P_MARGIN + 0.003) >= simantopmargin && (BOB_T0P_MARGIN - 0.003) <= simantopmargin)) {
                        isGAMEOVER = true;
                        [self pickImages];
                        break;
                    }
                } else {
                    if (((BOB_LEFT_MARGIN + 0.005) >= simanleftmargin && (BOB_LEFT_MARGIN - 0.005) <= simanleftmargin)
                        && BOB_T0P_MARGIN == simantopmargin) {
                        isGAMEOVER = true;
                        [self pickImages];
                        break;
                    }
                }// end of else
            }
        }*/
   }
}

-(IBAction)pauseView{
    if (!isPause) {
								isPause = true;
								Score_timeSwapBuff += Score_timeInMilliseconds;
    }
    cav=[[CameraAlertView alloc] init];

    bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, cav.demoView.bounds.size.width,cav.demoView.bounds.size.height)];
    [bgImage setImage:[UIImage imageNamed:@"gameoverimage.png"]];
    [cav.demoView addSubview:bgImage];

    UIButton *ResumeBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,130, cav.demoView.bounds.size.width,48)];
    [ResumeBtn setTitle:@"Resume" forState:UIControlStateNormal];
    [ResumeBtn addTarget:self
                     action:@selector(resumeAction)
           forControlEvents:UIControlEventTouchUpInside];
    [ResumeBtn.titleLabel setFont:[UIFont fontWithName:@"Hobo" size:50.0]];
    [ResumeBtn setBackgroundColor:[UIColor clearColor]];
    ResumeBtn.tag=1;
    
    [ResumeBtn setTitleColor:[UIColor colorWithHexString:@"0041b2"] forState:UIControlStateNormal];
    ResumeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [cav.demoView addSubview:ResumeBtn];
    
    ResumeBtn.alpha = 0.0f;
    [ResumeBtn setTitleColor:[UIColor colorWithHexString:@"0041b2"] forState:UIControlStateNormal];
    ResumeBtn.transform = CGAffineTransformMakeScale(1.2,1.2);
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:5000];
    ResumeBtn.transform = CGAffineTransformMakeScale(0.8,0.8);
    ResumeBtn.alpha = 1.0f;
    [UIView commitAnimations];
    
    UIButton *ExitBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,190, cav.demoView.bounds.size.width,48)];
    [ExitBtn setTitle:@"Exit" forState:UIControlStateNormal];
    [ExitBtn addTarget:self
                     action:@selector(exitAction)
           forControlEvents:UIControlEventTouchUpInside];
    [ExitBtn.titleLabel setFont:[UIFont fontWithName:@"Hobo" size:50.0]];
    [ExitBtn setBackgroundColor:[UIColor clearColor]];
    ExitBtn.tag=2;
    
    [ExitBtn setTitleColor:[UIColor colorWithHexString:@"0041b2"] forState:UIControlStateNormal];
    ExitBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [cav.demoView addSubview:ExitBtn];

    GADBannerView *bannerViewtop=[[GADBannerView alloc]init];
    [bannerViewtop setFrame:CGRectMake(40,0,cav.demoView.bounds.size.width-80,50)];
    bannerViewtop.adUnitID = @"ca-app-pub-1192482966027684/8176365056";
    bannerViewtop.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            @"2077ef9a63d2b398840261c8221a0c9a"  // Eric's iPod Touch
                            ];
    [bannerViewtop loadRequest:request];
    [cav.demoView addSubview:bannerViewtop];
    [cav.demoView bringSubviewToFront:bannerViewtop];
    
    GADBannerView *bannerViewDown=[[GADBannerView alloc]init];
    [bannerViewDown setFrame:CGRectMake(40,cav.demoView.bounds.size.height-50,cav.demoView.bounds.size.width-80,50)];
    bannerViewDown.adUnitID = @"ca-app-pub-1192482966027684/9653098255";
    bannerViewDown.rootViewController = self;
    
    GADRequest *requests = [GADRequest request];
    requests.testDevices = @[
                             @"2077ef9a63d2b398840261c8221a0c9a"  // Eric's iPod Touch
                             ];
    [bannerViewDown loadRequest:requests];
    [cav.demoView addSubview:bannerViewDown];
    [cav.demoView bringSubviewToFront:bannerViewDown];
    
    [cav show];

}
-(IBAction)resumeAction{
    vibrateCount=0;
    vibrateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(vibratePhone) userInfo:nil repeats:YES];

    
    if (isPause) {
								isPause = false;
								Score_startTime = [[NSDate date] timeIntervalSince1970];
        newscore=0;
        Updatescoretime=25;
    }
    [cav close];

}
-(IBAction)exitAction{
    [cav close];
    vibrateCount=0;
    vibrateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(vibratePhone) userInfo:nil repeats:YES];

    MenuViewController *menu=[[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    [self.navigationController pushViewController:menu animated:NO];

}
-(void)pickImages{
    [timer invalidate];
    admobCount=admobCount+1;
    if (admobCount==5) {
        admobCount=0;
        if ([self.interstitial isReady]) {
            [self.interstitial presentFromRootViewController:self];
        }else{
            [self dialogAction];
        }
    }else{
        [self dialogAction];
    }
    }
-(void)dialogAction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    vibrateCount=0;
    vibrateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(vibratePhone) userInfo:nil repeats:YES];
   /* for(UIView *subview in [mainscrollview subviews]) {
        
        [subview removeFromSuperview];
    }*/
    //[self AllViewDisplay];
    [redcolor removeFromSuperview];
    CURRENT_SCORE = 0;
    redline = 500;
    Score_timeInMilliseconds = 0L;
    Score_timeSwapBuff = 0L;
    Score_updatedTime = 0L;
    updatemint = 1;
    
    STARTSEC = 0, CURRENTSEC = 0;
    cav=[[CameraAlertView alloc] init];
    [timer invalidate];
    timer = nil;
    indexvalue=1;
    marginVO=[[MarginVO alloc]init];
    ywidthsim=10;
    ywidthbob=0;
    yheightsim=cav.demoView.bounds.size.height*0.68;
    simonArray=[[NSMutableArray alloc]init];
    repeatpointsDict= [[NSMutableDictionary alloc] init];
    timer2 = [NSTimer scheduledTimerWithTimeInterval: 0.015 target:self selector:@selector(BobisRunning) userInfo:nil repeats: YES];
    
    bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, cav.demoView.bounds.size.width,cav.demoView.bounds.size.height)];
    [bgImage setImage:[UIImage imageNamed:@"gameoverimage.png"]];
    [cav.demoView addSubview:bgImage];
    
    
    UILabel * gameOverLbl=[[UILabel alloc]initWithFrame:CGRectMake(0,100, cav.demoView.bounds.size.width,35)];
    gameOverLbl.font = [UIFont fontWithName:@"Hobo" size:45];
    gameOverLbl.text=@"GAME OVER";
    gameOverLbl.textAlignment = NSTextAlignmentCenter;
    gameOverLbl.textColor=[UIColor redColor];
    [cav.demoView addSubview:gameOverLbl];
    
    
    UILabel * scoreLbls=[[UILabel alloc]initWithFrame:CGRectMake(10,150, cav.demoView.bounds.size.width*0.67,35)];
    scoreLbls.font = [UIFont fontWithName:@"Hobo" size:37];
    scoreLbls.textAlignment = NSTextAlignmentCenter;
    scoreLbls.textColor=[UIColor redColor];
    UILabel * scoreDispalyLbls=[[UILabel alloc]init];
    NSUserDefaults *prefscore = [NSUserDefaults standardUserDefaults];
    scoreValuess=[[prefscore objectForKey:@"score"] integerValue];
    [highScoreDisplayLbl removeFromSuperview];
    highScoreDisplayLbl=[[UILabel alloc]initWithFrame:CGRectMake(85,35, 100,30)];
    highScoreDisplayLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
    highScoreDisplayLbl.textColor=[UIColor blackColor];
    
    highScoreDisplayLbl.text=[prefscore objectForKey:@"score"];
    if (score>scoreValuess) {
       scoreDispalyLbls.layer.frame=CGRectMake(0,150, cav.demoView.bounds.size.width,50);
        scoreDispalyLbls.font = [UIFont fontWithName:@"Hobo" size:36];
        scoreDispalyLbls.textAlignment = NSTextAlignmentCenter;

        scoreLbls.text=@"High Score:";
        scoreValuess= score;
        scoreDispalyLbls.text=@"";
        highScoreDisplayLbl.text=[NSString stringWithFormat:@"%ld", score];
        
        scoreDispalyLbls.text=[NSString stringWithFormat:@"High Score: %ld", score];
        NSUserDefaults *prefscore = [NSUserDefaults standardUserDefaults];
        [prefscore setObject:highScoreDisplayLbl.text forKey:@"score"];
        [prefscore synchronize];
        
        scoreLbls.alpha = 0.0f;
        scoreLbls.textColor=[UIColor redColor];
        scoreLbls.transform = CGAffineTransformMakeScale(0.9,0.9);
        [UIView beginAnimations:@"fadeInNewView" context:NULL];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationRepeatCount:5000];
        scoreLbls.transform = CGAffineTransformMakeScale(0.6,0.6);
        scoreLbls.alpha = 1.0f;
        [UIView commitAnimations];
        
        scoreDispalyLbls.alpha = 0.0f;
        scoreDispalyLbls.textColor=[UIColor redColor];
        scoreDispalyLbls.transform = CGAffineTransformMakeScale(1.2,1.2);
        [UIView beginAnimations:@"fadeInNewView" context:NULL];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationRepeatCount:5000];
        scoreDispalyLbls.transform = CGAffineTransformMakeScale(0.8,0.8);
        scoreDispalyLbls.alpha = 1.0f;
        [UIView commitAnimations];
        
        
        
    }else{
        scoreDispalyLbls.layer.frame=CGRectMake(0,150, cav.demoView.bounds.size.width,45);
        scoreDispalyLbls.font = [UIFont fontWithName:@"Hobo" size:40];
        scoreDispalyLbls.textAlignment = NSTextAlignmentCenter;

        scoreLbls.text=@"Score :";
        scoreDispalyLbls.text=@"";
        scoreDispalyLbls.text=[NSString stringWithFormat:@"Score:%ld",score];
        
    }
    [self.view addSubview:highScoreDisplayLbl];
    [self.view bringSubviewToFront:highScoreDisplayLbl];
    
   // [cav.demoView addSubview:scoreLbls];
    
    scoreDispalyLbls.textColor=[UIColor redColor];
    [cav.demoView addSubview:scoreDispalyLbls];
    
    
    UIButton *playAgainBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,210, cav.demoView.bounds.size.width,48)];
    [playAgainBtn setTitle:@"Play Again" forState:UIControlStateNormal];
    [playAgainBtn addTarget:self
                     action:@selector(playAgain)
           forControlEvents:UIControlEventTouchUpInside];
    [playAgainBtn.titleLabel setFont:[UIFont fontWithName:@"Hobo" size:30.0]];
    [playAgainBtn setBackgroundColor:[UIColor clearColor]];
    playAgainBtn.tag=1;
    
    [playAgainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    playAgainBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [cav.demoView addSubview:playAgainBtn];
    
    playAgainBtn.alpha = 0.0f;
    [playAgainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    playAgainBtn.transform = CGAffineTransformMakeScale(1.5,1.5);
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:5000];
    playAgainBtn.transform = CGAffineTransformMakeScale(0.8,0.8);
    playAgainBtn.alpha = 1.0f;
    [UIView commitAnimations];
    
    
    UIButton *mainmenuBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,250, cav.demoView.bounds.size.width,50)];
    [mainmenuBtn setTitle:@"Menu" forState:UIControlStateNormal];
    [mainmenuBtn addTarget:self
                    action:@selector(goToMainMenu)
          forControlEvents:UIControlEventTouchUpInside];
    [mainmenuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    mainmenuBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [mainmenuBtn.titleLabel setFont:[UIFont fontWithName:@"Hobo" size:30.0]];
    [mainmenuBtn setBackgroundColor:[UIColor clearColor]];
    mainmenuBtn.tag=1;
    [cav.demoView addSubview:mainmenuBtn];
    
    GADBannerView *bannerViewtop=[[GADBannerView alloc]init];
    [bannerViewtop setFrame:CGRectMake(40,0,cav.demoView.bounds.size.width-80,50)];
    bannerViewtop.adUnitID = @"ca-app-pub-1192482966027684/3746165453";
    bannerViewtop.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            @"2077ef9a63d2b398840261c8221a0c9a"  // Eric's iPod Touch
                            ];
    [bannerViewtop loadRequest:request];
    [cav.demoView addSubview:bannerViewtop];
    [cav.demoView bringSubviewToFront:bannerViewtop];
    
    GADBannerView *bannerViewDown=[[GADBannerView alloc]init];
    [bannerViewDown setFrame:CGRectMake(40,cav.demoView.bounds.size.height-50,cav.demoView.bounds.size.width-80,50)];
    bannerViewDown.adUnitID = @"ca-app-pub-1192482966027684/5222898652";
    bannerViewDown.rootViewController = self;
    
    GADRequest *requests = [GADRequest request];
    requests.testDevices = @[
                             @"2077ef9a63d2b398840261c8221a0c9a"  // Eric's iPod Touch
                             ];
    [bannerViewDown loadRequest:requests];
    [cav.demoView addSubview:bannerViewDown];
    [cav.demoView bringSubviewToFront:bannerViewDown];
    
    [cav show];

}
-(void)BobisRunning{
    [bobImg removeFromSuperview];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat checkcod = cav.demoView.bounds.size.width*0.45;
    CGFloat checkcodss = cav.demoView.bounds.size.width*0.85;
    CGFloat checkcdss = cav.demoView.bounds.size.height*0.77;

    CGFloat BOB_T0P_MARGINheight;

    if (checkcod<=ywidthsim) {
        if(checkcdss<=yheightsim){
            ywidthsim=ywidthsim+(screenRect.size.width*0.003);
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(ywidthsim,cav.demoView.bounds.size.height*0.77, screenRect.size.height*0.05,screenRect.size.height*0.05)];
            BOB_T0P_MARGINheight=cav.demoView.bounds.size.height*0.77;
            
        }else{
            yheightsim=yheightsim+(screenRect.size.height*0.003);
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(cav.demoView.bounds.size.width*0.45,yheightsim, screenRect.size.height*0.05,screenRect.size.height*0.05)];
            BOB_T0P_MARGINheight=yheightsim;

        }
           }else if (ywidthsim>=10) {
        ywidthsim=ywidthsim+(screenRect.size.width*0.003);
        BOB_T0P_MARGINheight=cav.demoView.bounds.size.height*0.68;
        bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(ywidthsim,cav.demoView.bounds.size.height*0.68, screenRect.size.height*0.05,screenRect.size.height*0.05)];

    }
    
    if (checkcodss<=ywidthsim) {
        ywidthsim=10;
        yheightsim=cav.demoView.bounds.size.height*0.68;;
        ywidthsim=ywidthsim+(screenRect.size.width*0.003);
        BOB_T0P_MARGINheight=cav.demoView.bounds.size.height*0.68;
    }
    
    [bobImg setImage:[UIImage imageNamed:@"bobimage.png"]];
    [cav.demoView addSubview:bobImg];
    marginVO=[[MarginVO alloc]init];
    marginVO.simLeftRight=[NSString stringWithFormat: @"%.4f", ywidthsim];
    marginVO.simTopDown=[NSString stringWithFormat: @"%.4f", BOB_T0P_MARGINheight];
    [simonArray addObject:marginVO];

    if (simonArray.count>=50) {
        [simamImg removeFromSuperview];
        marginVO=[[MarginVO alloc]init];
        marginVO=[simonArray objectAtIndex:indexvalue];
        CGFloat leftsizwe,topsize;
        topsize=(CGFloat)[marginVO.simTopDown floatValue];
        leftsizwe=(CGFloat)[marginVO.simLeftRight floatValue];
        simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(leftsizwe,topsize, screenRect.size.height*0.05,screenRect.size.height*0.05)];
        [simamImg setImage:[UIImage imageNamed:@"simamimage.png"]];
        [cav.demoView addSubview:simamImg];
        indexvalue=indexvalue+1;
        
    }
}

-(void)AddColorView{

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat topmargin=0;
    CGFloat leftmargin=0;
    
        if (isMovingUp) {
            topmargin = (int) (screenRect.size.height * (BOB_T0P_MARGIN + 0.035));
            leftmargin = (int) (screenRect.size.width * (BOB_LEFT_MARGIN + 0.02));
        } else if (isMovingDown)
        {
            topmargin = (int) (screenRect.size.height * (BOB_T0P_MARGIN-0.01));
            leftmargin = (int) (screenRect.size.width * (BOB_LEFT_MARGIN + 0.02));
        } else if (isMovingRight) {
           topmargin = (int) (screenRect.size.height * (BOB_T0P_MARGIN + 0.01));
            leftmargin = (int) (screenRect.size.width * (BOB_LEFT_MARGIN-0.02));
        } else if (isMovingLeft) {
            topmargin = (int) (screenRect.size.height * (BOB_T0P_MARGIN + 0.01));
            leftmargin = (int) (screenRect.size.width * (BOB_LEFT_MARGIN + 0.05));
        }
    redcolor=[[UIImageView alloc]initWithFrame:CGRectMake(leftmargin+3,topmargin+5, screenRect.size.width*0.025,screenRect.size.width*0.025)];
    redcolor.layer.cornerRadius = 5;
    redcolor.clipsToBounds = YES;
    [redcolor setBackgroundColor:[UIColor redColor]];

}
-(void)playAgain{
    [timer invalidate];
    [timer2 invalidate];
    timer=nil;
    timer2=nil;
    HomeViewController *home;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        home=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    }else{
        home=[[HomeViewController alloc] initWithNibName:@"HomeViewController~ipad" bundle:nil];
    }
    [self.navigationController pushViewController:home animated:NO];
    [cav close];

    /*Updatescoretime=25;
    score = 0;
    [scoreDisplyayLbl removeFromSuperview];
    scoreDisplyayLbl=[[UILabel alloc]initWithFrame:CGRectMake(60,10, 80,30)];
    scoreDisplyayLbl.font=[UIFont fontWithName:@"Hobo" size:15.0];
    scoreDisplyayLbl.textColor=[UIColor blackColor];
    scoreDisplyayLbl.text=[NSString stringWithFormat:@"%ld", score];
    [self.view addSubview:scoreDisplyayLbl];
    [self.view bringSubviewToFront:scoreDisplyayLbl];

    Score_startTime=[[NSDate date] timeIntervalSince1970];
    newscore=0;
    for(UIView *subview in [mainscrollview subviews]) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            if (subview.backgroundColor==[UIColor redColor]) {
                [subview removeFromSuperview];
            }
        }
    }
    [timer2 invalidate];
    timer2 = nil;

    isGAMEOVER=false;
    isMaproad1_1 = false;
    isMaproad1_2 = false;
    isMaproad1_3 = false;
    isMaproad1_4 = false; isMaproad2_1 = false;
    isMaproad2_2 = true;  isMaproad2_3 = false; isMaproad2_4 = false;
    isMaproad3_1 = false; isMaproad3_2 = false; isMaproad3_3 = false;
    isMaproad3_4 = false; isMaproad4_1 = false; isMaproad4_2 = false;
    isMaproad4_3 = false; isMaproad4_4= false;

    [timer invalidate];
    simonArray=[[NSMutableArray alloc]init];

    
    isMovingUp=YES;
    indexvalue=0;
    marginVO=[[MarginVO alloc]init];*/
}
-(void)goToMainMenu{
    [cav close];
    MenuViewController *menu=[[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    [self.navigationController pushViewController:menu animated:NO];
}
-(void)MoveRIGHTAnimation{
    //NSLog(@"MoveRIGHTAnimation");

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    // -----------------scrolling animation
    
    
    if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.10
        && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.25) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];

        if (BOB_T0P_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
            
        }else if (BOB_T0P_MARGIN<1.10) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
            
        }else{

        [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
        }
        [UIView commitAnimations];

    } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.39
               && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.42) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        if (BOB_T0P_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
            
        }else if (BOB_T0P_MARGIN<1.10) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
            
        }else{
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
        }
        [UIView commitAnimations];
        
    }
    else
            if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.60
                && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.61) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.25),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.25),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.25),BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.25),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{

                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.25),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.85
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.86) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.50),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.50),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.50),BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.50),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.50),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 1.15)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.16) {
                if (BOB_T0P_MARGIN<0.60) {
                    [UIView beginAnimations:nil context:NULL];
                    [UIView setAnimationDuration:1.0];

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.75),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.75),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.75),BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.75),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.75),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 1.40)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 1.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width ,0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width,BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width,BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width,BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width ),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            }
            // -------------
    
    
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 1.55
                     && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.56) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.25),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*1.25,BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*1.25,BOB_T0P_MARGIN*(bobrightmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*1.25,BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*1.25,BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            }
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 1.60
                     && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.61) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.50),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width * 1.50,BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width * 1.50,BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width * 1.50,BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake(screenRect.size.width * 1.50,BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 1.85
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.86) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.75),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.75),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.75),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.75),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.75),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            }else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 2.15)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 2.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 2.40)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 2.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.25),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.25),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.25),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.25),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.25),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            }
            // -------------
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 2.60
                     && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 2.61) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.50),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.50),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.50),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.10){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.50),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.50),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 2.85
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 2.86) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.65),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.65),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.65),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.65),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.65),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 3.15)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 3.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.80),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.80),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.80),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.80),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.80),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 3.40)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 3.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_T0P_MARGIN<0.60) {

                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.10) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobrightmargin-100)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobrightmargin)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobrightmargin+80)) animated:NO];
                    
                }else{
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobrightmargin+100)) animated:NO];
                }
            }
    
}
-(void)MoveLEFTAnimation{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveLEFTAnimation");

            // -----------------scrolling animation
    
    if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.0
        && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.25) {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        if (BOB_T0P_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];

        }else if (BOB_T0P_MARGIN<1.50) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*bobtopmargin) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];

        }else if (BOB_T0P_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];

        }else{
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*((bobtopmargin+150))) animated:NO];
 
        }
        [UIView commitAnimations];

    }
    else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.39
                && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.42) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        if (BOB_T0P_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
            
        }else if (BOB_T0P_MARGIN<1.50) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*bobtopmargin) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
            
        }else if (BOB_T0P_MARGIN<2.60){
        [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
        }else{
            [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*((bobtopmargin+150))) animated:NO];

        }
        [UIView commitAnimations];

    }
          else   if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.65
                && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.66) {
              [UIView beginAnimations:nil context:NULL];
              [UIView setAnimationDuration:1.0];
              if (BOB_T0P_MARGIN<0.60) {
                  [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
                  
              }else if (BOB_T0P_MARGIN<1.50) {
                  [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                  
              }else if (BOB_T0P_MARGIN<2) {
                  [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                  
              }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
              }else{
                  [mainscrollview setContentOffset:CGPointMake(0,BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

              }
              [UIView commitAnimations];

            }
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 0.90
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 0.91) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.20),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.30),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.30),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.30),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.30),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            }
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 1.15)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.50),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.60),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.60),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.60),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 0.60),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            }
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 1.40)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 1.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*0.85,0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*0.85,BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*0.85,BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*0.85,BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(screenRect.size.width*0.85,BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            }
            // -------------
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 1.65
                     && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.66) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width ),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width ),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width ),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width ),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width ),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];
 
                }
                [UIView commitAnimations];


            }else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 1.75
                      && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.88) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width *1.20 ),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width*1.20 ),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width*1.20 ),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width*1.20 ),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width*1.20 ),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];
                    
                }
                [UIView commitAnimations];
                
                
            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 1.90
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 1.91) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.40),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.40),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.40),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.40),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.40),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 2.15)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 2.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.65),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.65),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.65),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.65),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.65),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 2.40)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 2.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.85),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.85),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.85),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.85),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 1.85),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];
            }
            // -------------
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 2.65
                     && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 2.66) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.05),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.05),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.05),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.05),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.05),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];
 
                }
                [UIView commitAnimations];


            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > screenRect.size.width * 2.90
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 2.91) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.30),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.30),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.30),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.30),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }
                else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.30),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 3.15)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < screenRect.size.width * 3.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.75),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.75),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.75),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.75),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 2.75),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 3.40)
                       && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 3.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];
            }
            else if ((BOB_LEFT_MARGIN * screenRect.size.width) > (screenRect.size.width * 3.86)
                     && (BOB_LEFT_MARGIN * screenRect.size.width) < (screenRect.size.width * 3.87)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_T0P_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3.50),0) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3.50),BOB_T0P_MARGIN*bobtopmargin) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3.50),BOB_T0P_MARGIN*(bobtopmargin+30)) animated:NO];
                    
                }else if (BOB_T0P_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3.50),BOB_T0P_MARGIN*(bobtopmargin+80)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake((screenRect.size.width * 3.50),BOB_T0P_MARGIN*(bobtopmargin+150)) animated:NO];

                }
                [UIView commitAnimations];

            }
}
-(void)MoveDOWNAnimation{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveDOWNAnimation");

            // -----------------scrolling animation
            if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.10
                && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.35) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.10)) animated:NO];

                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 0.10)) animated:NO];
                    
                }
                else if (BOB_LEFT_MARGIN<2.60) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 0.10)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 0.10)) animated:NO];
 
                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.36
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.66) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.25)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 0.25)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 0.25)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 0.20)) animated:NO];

                }
                [UIView commitAnimations];
                
            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.70
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.75) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 0.30)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.30)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 0.30)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 0.30)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 0.30)) animated:NO];

                }
                [UIView commitAnimations];

            }else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.80
                      && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.95) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 0.60)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.60)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 0.60)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 0.60)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 0.60)) animated:NO];
                    
                }
                [UIView commitAnimations];
                
            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 1.05)
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 1.25) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 0.85)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.85)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 0.85)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 0.85)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 0.85)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 1.40)
                       && (BOB_T0P_MARGIN * screenRect.size.height) < (screenRect.size.height * 1.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];

                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.10)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.10)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 1.10)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),screenRect.size.height*1.10) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),screenRect.size.height*1.10) animated:NO];
 
                }
                [UIView commitAnimations];

            }
            else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 1.65
                     && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 1.66) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.25)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.25)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 1.25)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 1.25)) animated:NO];
                
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 1.25)) animated:NO];
 
                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 1.90
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 1.91) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.50)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.50)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 1.50)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*((bobdownmarign+40)),(screenRect.size.height * 1.50)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 1.50)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 2.15)
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.80)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.80)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 1.80)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 1.80)) animated:NO];

                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 1.80)) animated:NO];

                }
                [UIView commitAnimations];

            }else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 2.25)
                      && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.35) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.95)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.95)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 1.95)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 1.95)) animated:NO];

                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 1.95)) animated:NO];
                    
                }
                [UIView commitAnimations];
                
            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 2.40)
                       && (BOB_T0P_MARGIN * screenRect.size.height) < (screenRect.size.height * 2.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.10)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.10)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 2.10)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 2.10)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 2.10)) animated:NO];

                }
                [UIView commitAnimations];

            }
            // ---------
            else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 2.65
                     && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.66) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.35)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.35)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 2.35)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 2.35)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 2.35)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 2.90
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.91) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.60)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.60)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 2.60)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 2.60)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 2.60)) animated:NO];

                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 3.15)
                       && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 3.16) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.85)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.85)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 2.85)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),(screenRect.size.height * 2.85)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),(screenRect.size.height * 2.85)) animated:NO];
                    
                }
                [UIView commitAnimations];

            } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 3.40)
                       && (BOB_T0P_MARGIN * screenRect.size.height) < (screenRect.size.height * 3.41)) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 3.10)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 3.10)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+30),(screenRect.size.height * 3.10)) animated:NO];
                    
                } else if (BOB_LEFT_MARGIN<2.60){
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+40),screenRect.size.height * 3.10) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+50),screenRect.size.height * 3.10) animated:NO];

                }
                [UIView commitAnimations];

            }
}
-(void)MoveUpAnimation{
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    //NSLog(@"MoveUpAnimation");

        // -----------------scrolling animation
    if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.05
        && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.35) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        if (BOB_LEFT_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<1.50) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<2.60){
        [mainscrollview setContentOffset:CGPointMake((BOB_LEFT_MARGIN*(bobleftmargin+50)),
                                                     (screenRect.size.height * 0.02)) animated:NO];
        }else{
            [mainscrollview setContentOffset:CGPointMake((BOB_LEFT_MARGIN*(bobleftmargin+50)),
                                                         0) animated:NO];

        }
        
        [UIView commitAnimations];
    }
    else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.35
        && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.55) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        if (BOB_LEFT_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<1.50) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake((BOB_LEFT_MARGIN*(bobleftmargin+50)),
                                                         0) animated:NO];
        }else{
            [mainscrollview setContentOffset:CGPointMake((BOB_LEFT_MARGIN*(bobleftmargin+50)),
                                                         0) animated:NO];
            
        }
        
        [UIView commitAnimations];
    }
    else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.65
            && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.654) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        if (BOB_LEFT_MARGIN<0.60) {
            [mainscrollview setContentOffset:CGPointMake(0,0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<1.50) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<2) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),0) animated:NO];
            
        }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
             0) animated:NO];
        }else{
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         0) animated:NO];

        }
        [UIView commitAnimations];
        } else
            if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 0.90
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 0.904) {
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1.0];
                if (BOB_LEFT_MARGIN<0.60) {
                    [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 0.25)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<1.50) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.25)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2) {
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 0.25)) animated:NO];
                    
                }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin)+50,
                                                          (screenRect.size.height * 0.25)) animated:NO];
                }else{
                    [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                                 (screenRect.size.height * 0.25)) animated:NO];

                }
                [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 1.15)
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 1.20) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 0.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 0.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 0.50)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 0.50)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 1.40)
                   && (BOB_T0P_MARGIN * screenRect.size.height) < (screenRect.size.height * 1.404)) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 0.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 0.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 0.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 0.75)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 0.75)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 1.65
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 1.654) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,screenRect.size.height ) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height )) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 1.90
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 1.904) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.25)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.25)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 1.25)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 1.25)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 1.25)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 2.15)
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.154) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 1.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 1.50)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 1.50)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 2.40)
                   && (BOB_T0P_MARGIN * screenRect.size.height) < (screenRect.size.height * 2.404)) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 1.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 1.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 1.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 1.75)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 1.75)) animated:NO];
            }
            [UIView commitAnimations];
        }
        // ---------
        else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 2.65
                 && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.654) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 2)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 2)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 2)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > screenRect.size.height * 2.90
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 2.904) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.25)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.25)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 2.25)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60){
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 2.25)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 2.25)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 3.15)
                   && (BOB_T0P_MARGIN * screenRect.size.height) < screenRect.size.height * 3.154) {
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 2.50)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60) {
            [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 2.50)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 2.50)) animated:NO];

            }
            [UIView commitAnimations];
        } else if ((BOB_T0P_MARGIN * screenRect.size.height) > (screenRect.size.height * 3.40)
                   && (BOB_T0P_MARGIN * screenRect.size.height) < (screenRect.size.height * 3.404)) {
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            if (BOB_LEFT_MARGIN<0.60) {
                [mainscrollview setContentOffset:CGPointMake(0,(screenRect.size.height * 2.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<1.50) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign-20),(screenRect.size.height * 2.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2) {
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobdownmarign+10),(screenRect.size.height * 2.75)) animated:NO];
                
            }else if (BOB_LEFT_MARGIN<2.60) {
                        [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                         (screenRect.size.height * 2.75)) animated:NO];
            }else{
                [mainscrollview setContentOffset:CGPointMake(BOB_LEFT_MARGIN*(bobleftmargin+50),
                                                             (screenRect.size.height * 2.75)) animated:NO];

            }
            [UIView commitAnimations];
        }
}
-(void)MoveRightDown_to_up:(CGFloat )leftmargin :(CGFloat)topmargin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveRightDown_to_up");

        if (isMaproad1_1) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 0.98)) {
                isMaproad1_1 = false;
                isMaproad1_2 = true;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.535))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.135))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.255))
                     && (leftmargin > ((screenRect.size.width * 0.165)) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.335))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.76)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.435))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.685))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.51)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.785))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.935))
                     && (leftmargin > ((screenRect.size.width * 0.415)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];

            }
            
        }// end of is Map Road 1_1
        else if (isMaproad2_1) {
           if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 0.93)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = true;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.535))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.135))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.255))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.83)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.335))
                     && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.435))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.36)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.685))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.785))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.935))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 2_1
        else if (isMaproad1_2) {
            
            if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 1.96)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = true;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.535))
                && (leftmargin > (screenRect.size.width * 0.95) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.135))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.255))
                     && (leftmargin > ((screenRect.size.width * 0.96)) && leftmargin < ((screenRect.size.width * 1.91)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.335))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.35)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.435))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.685))
                     && (leftmargin > ((screenRect.size.width * 1.565)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.785))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.935))
                     && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 1_2
        else if (isMaproad2_2) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 1.96)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = true;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.535))
                && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.135))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.255))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.335))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.25)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.435))
                     && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 1.905)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.685))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.785))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.935))
                     && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 2_2
        else if (isMaproad1_3) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.535))
                && (leftmargin > (screenRect.size.width * 2.315) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.135))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.91)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.255))
                     && (leftmargin > ((screenRect.size.width * 2.46)) && leftmargin < ((screenRect.size.width * 2.91)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.335))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.60)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.435))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.51)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.685))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.785))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.935))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 1_3
        else if (isMaproad2_3) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.535))
                && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.135))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.255))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.335))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.435))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.685))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.785))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.25)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.935))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 2_3
        else if (isMaproad3_1) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 0.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = true;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.535))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.135))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.255))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.81)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.335))
                     && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 0.75)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.435))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.35)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.685))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.50)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.785))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.935))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 3_1
        else if (isMaproad3_2) {
            
        if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 1.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = true;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.535))
                && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.135))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.255))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.335))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.35)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.435))
                     && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.685))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.785))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.935))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is Map Road 3_2
        else if (isMaproad3_3) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.535))
                && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.135))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.255))
                     && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.335))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.80)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.435))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.685))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.80)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.785))
                     && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.26)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.935))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];
            }
            
        }// end of is Map Road 3_3
    if(isValidMove==false){
        isGAMEOVER = true;
        [self pickImages];

    }
    
}
-(void)MoveDownRight_to_Left:(CGFloat )leftmargin :(CGFloat)topmargin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    //NSLog(@"MoveDownRight_to_Left");

        if (isMaproad1_1) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = true;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.02) && topmargin < (screenRect.size.height * 1.20))
                && (leftmargin > (int) ((screenRect.size.width * 0.465))
                    && leftmargin < (int) ((screenRect.size.width * 0.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.02)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.135))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.61)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.51)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.385))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.06)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.785))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.06)
                      && topmargin < (screenRect.size.height * 1.20)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.935))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
        }// end of is mapRoad 1_1
        else if (isMaproad2_1) {
           if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = true;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.80) && topmargin < (screenRect.size.height * 1.91))
                && (leftmargin > (int) ((screenRect.size.width * 0.465))
                    && leftmargin < (int) ((screenRect.size.width * 0.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 2.20)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.135))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.61)
                      && topmargin < (screenRect.size.height * 2.20)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.285))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 1.61)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.385))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.95)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.785))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.80)
                      && topmargin < (screenRect.size.height * 1.91)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.935))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is mapRoad 2_1
        else if (isMaproad1_2) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = true;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 1.10))
                && (leftmargin > (int) ((screenRect.size.width * 1.465))
                    && leftmargin < (int) ((screenRect.size.width * 1.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 1;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.715)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 1.10)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.03)
                      && topmargin < (screenRect.size.height * 0.75)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
        }// end of is mapRoad 1_2
        
        else if (isMaproad2_2) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = true;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.93) && topmargin < (screenRect.size.height * 1.90))
                && (leftmargin > (int) ((screenRect.size.width * 1.465))
                    && leftmargin < (int) ((screenRect.size.width * 1.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 1;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.76)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.715)
                      && topmargin < (screenRect.size.height * 1.91)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.065)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
        }// end of is mapRoad 2_2
        else if (isMaproad1_3) {
            
           if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = true;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 0.90))
                && (leftmargin > (int) ((screenRect.size.width * 2.465))
                    && leftmargin < (int) ((screenRect.size.width * 2.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 2;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 1.20)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.715)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.61)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.065)
                      && topmargin < (screenRect.size.height * 1.10)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.065)
                      && topmargin < (screenRect.size.height * 0.81)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
        }// end of is mapRoad 1_3
        else if (isMaproad2_3) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = true;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 2.10))
                && (leftmargin > (int) ((screenRect.size.width * 2.465))
                    && leftmargin < (int) ((screenRect.size.width * 2.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 2;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 1.75)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.715)
                      && topmargin < (screenRect.size.height * 1.90)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.60)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 1.90)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.065)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
        }// end of is mapRoad 2_3
        
        else if (isMaproad3_1) {
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 2.01) && topmargin < (screenRect.size.height * 3.10))
                && (leftmargin > (int) ((screenRect.size.width * 0.465))
                    && leftmargin < (int) ((screenRect.size.width * 0.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.135))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.35)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.285))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.265)
                      && topmargin < (screenRect.size.height * 2.80)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.385))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.785))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.935))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
            
        }// end of is mapRoad 3_1
        else if (isMaproad3_2) {
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 3.10))
                && (leftmargin > (int) ((screenRect.size.width * 1.465)) 
                    && leftmargin < (int) ((screenRect.size.width * 1.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 1;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.75)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 2.715)
                      && topmargin < (screenRect.size.height * 2.905)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.75)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];
            }
        }// end of is mapRoad 3_2
        else if (isMaproad3_3) {
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 1.93) && topmargin < (screenRect.size.height * 2.35))
                && (leftmargin > (int) ((screenRect.size.width * 2.465)) 
                    && leftmargin < (int) ((screenRect.size.width * 2.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 2;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.85)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 2.715)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.185)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.50)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];
            }
        }// end of is mapRoad 3_3
        
    if(isValidMove==false){
            isGAMEOVER = true;
        [self pickImages];
    }
    
}
-(void)MoveDown:(CGFloat )leftmargin :(CGFloat)topmargin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveDown");

   if (isMaproad1_1) {
       if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = true;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }

        // -----ver 4
        if ((topmargin > (screenRect.size.height * 0.02) && topmargin < (screenRect.size.height * 1.20))
            && (leftmargin > (int) ((screenRect.size.width * 0.465)) && leftmargin < (int) ((screenRect.size.width * 0.495)))) {
            BOB_LEFT_MARGIN = ver_4_left;
            isValidMove=true;
        }
        // -----ver 1
        else if ((topmargin > (screenRect.size.height * 0.02)
                  && topmargin < (screenRect.size.height * 0.76)
                  && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.095))) {
            BOB_LEFT_MARGIN = ver_1_left;
            isValidMove=true;
        }
        // -----ver 2
        else if ((topmargin > (screenRect.size.height * 0.61)
                  && topmargin < (screenRect.size.height * 0.76)
                  && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
            BOB_LEFT_MARGIN = ver_2_left;
            isValidMove=true;
        }
        // -----ver 3
        else if ((topmargin > (screenRect.size.height * 0.07)
                  && topmargin < (screenRect.size.height * 0.51)
                  && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.345))) {
            BOB_LEFT_MARGIN = ver_3_left;
            isValidMove=true;
        }
        // -----ver 5
        else if ((topmargin > (screenRect.size.height * 0.06)
                  && topmargin < (screenRect.size.height * 0.91)
                  && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.745))) {
            BOB_LEFT_MARGIN = ver_5_left;
            isValidMove=true;
        }
        // -----ver 6
        else if ((topmargin > (screenRect.size.height * 0.06)
                  && topmargin < (screenRect.size.height * 1.20)
                  && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.895))) {
            BOB_LEFT_MARGIN = ver_6_left;
            isValidMove=true;
        } else {
            isGAMEOVER = true;
            [self pickImages];

        }
    }
    
    // end of is mapRoad 1_1
   else if (isMaproad2_1) {
       if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = true;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 0.80) && topmargin < (screenRect.size.height * 1.91))
           && (leftmargin > (int) ((screenRect.size.width * 0.465)) && leftmargin < (int) ((screenRect.size.width * 0.495)))) {
           BOB_LEFT_MARGIN = ver_4_left;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 1.06)
                 && topmargin < (screenRect.size.height * 2.20)
                 && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.095))) {
           BOB_LEFT_MARGIN = ver_1_left;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 1.61)
                 && topmargin < (screenRect.size.height * 2.20)
                 && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
           BOB_LEFT_MARGIN = ver_2_left;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 1.06)
                 && topmargin < (screenRect.size.height * 1.61)
                 && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.345))) {
           BOB_LEFT_MARGIN = ver_3_left;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 1.07)
                 && topmargin < (screenRect.size.height * 1.95)
                 && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.745))) {
           BOB_LEFT_MARGIN = ver_5_left;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 0.80)
                 && topmargin < (screenRect.size.height * 1.91)
                 && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.895))) {
           BOB_LEFT_MARGIN = ver_6_left;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is mapRoad 2_1
   else if (isMaproad1_2) {
       if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = true;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 1.10))
           && (leftmargin > (int) ((screenRect.size.width * 1.465)) && leftmargin < (int) ((screenRect.size.width * 1.495)))) {
           BOB_LEFT_MARGIN = ver_4_left + 1;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 0.07)
                 && topmargin < (screenRect.size.height * 0.76)
                 && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.095))) {
           BOB_LEFT_MARGIN = ver_1_left + 1;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 0.715)
                 && topmargin < (screenRect.size.height * 0.91)
                 && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.245))) {
           BOB_LEFT_MARGIN = ver_2_left + 1;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 0.07)
                 && topmargin < (screenRect.size.height * 0.61)
                 && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.345))) {
           BOB_LEFT_MARGIN = ver_3_left + 1;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 0.07)
                 && topmargin < (screenRect.size.height * 1.10)
                 && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.745))) {
           BOB_LEFT_MARGIN = ver_5_left + 1;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 0.03)
                 && topmargin < (screenRect.size.height * 0.75)
                 && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.895))) {
           BOB_LEFT_MARGIN = ver_6_left + 1;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
   }// end of is mapRoad 1_2
    
   else if (isMaproad2_2) {
       if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = true;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 0.93) && topmargin < (screenRect.size.height * 1.90))
           && (leftmargin > (int) ((screenRect.size.width * 1.465)) && leftmargin < (int) ((screenRect.size.width * 1.495)))) {
           BOB_LEFT_MARGIN = ver_4_left + 1;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 1.07)
                 && topmargin < (screenRect.size.height * 1.76)
                 && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.095))) {
           BOB_LEFT_MARGIN = ver_1_left + 1;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 1.715)
                 && topmargin < (screenRect.size.height * 1.91)
                 && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.245))) {
           BOB_LEFT_MARGIN = ver_2_left + 1;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 1.07)
                 && topmargin < (screenRect.size.height * 1.61)
                 && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.345))) {
           BOB_LEFT_MARGIN = ver_3_left + 1;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 0.93)
                 && topmargin < (screenRect.size.height * 2.10)
                 && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.745))) {
           BOB_LEFT_MARGIN = ver_5_left + 1;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 1.065)
                 && topmargin < (screenRect.size.height * 2.10)
                 && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.895))) {
           BOB_LEFT_MARGIN = ver_6_left + 1;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
   }// end of is mapRoad 2_2
   else if (isMaproad1_3) {
       
       if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = true;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 0.90))
           && (leftmargin > (int) ((screenRect.size.width * 2.465)) && leftmargin < (int) ((screenRect.size.width * 2.495)))) {
           BOB_LEFT_MARGIN = ver_4_left + 2;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 0.07)
                 && topmargin < (screenRect.size.height * 1.20)
                 && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.095))) {
           BOB_LEFT_MARGIN = ver_1_left + 2;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 0.715)
                 && topmargin < (screenRect.size.height * 0.91)
                 && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.245))) {
           BOB_LEFT_MARGIN = ver_2_left + 2;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 0.07)
                 && topmargin < (screenRect.size.height * 0.61)
                 && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.345))) {
           BOB_LEFT_MARGIN = ver_3_left + 2;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 0.065)
                 && topmargin < (screenRect.size.height * 1.10)
                 && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.745))) {
           BOB_LEFT_MARGIN = ver_5_left + 2;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 0.065)
                 && topmargin < (screenRect.size.height * 0.81)
                 && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.895))) {
           BOB_LEFT_MARGIN = ver_6_left + 2;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
   }// end of is mapRoad 1_3
   else if (isMaproad2_3) {
    if ((screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = true;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 2.10))
           && (leftmargin > (int) ((screenRect.size.width * 2.465)) && leftmargin < (int) ((screenRect.size.width * 2.495)))) {
           BOB_LEFT_MARGIN = ver_4_left + 2;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 0.93)
                 && topmargin < (screenRect.size.height * 1.75)
                 && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.095))) {
           BOB_LEFT_MARGIN = ver_1_left + 2;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 1.715)
                 && topmargin < (screenRect.size.height * 1.90)
                 && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.245))) {
           BOB_LEFT_MARGIN = ver_2_left + 2;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 1.07)
                 && topmargin < (screenRect.size.height * 1.60)
                 && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.345))) {
           BOB_LEFT_MARGIN = ver_3_left + 2;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 0.93)
                 && topmargin < (screenRect.size.height * 1.90)
                 && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.745))) {
           BOB_LEFT_MARGIN = ver_5_left + 2;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 1.065)
                 && topmargin < (screenRect.size.height * 2.10)
                 && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.895))) {
           BOB_LEFT_MARGIN = ver_6_left + 2;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
   }// end of is mapRoad 2_3
    
   else if (isMaproad3_1) {
       
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 2.01) && topmargin < (screenRect.size.height * 3.10))
           && (leftmargin > (int) ((screenRect.size.width * 0.465)) && leftmargin < (int) ((screenRect.size.width * 0.495)))) {
           BOB_LEFT_MARGIN = ver_4_left;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 1.93)
                 && topmargin < (screenRect.size.height * 2.90)
                 && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.095))) {
           BOB_LEFT_MARGIN = ver_1_left;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 1.93)
                 && topmargin < (screenRect.size.height * 2.35)
                 && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
           BOB_LEFT_MARGIN = ver_2_left;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 2.265)
                 && topmargin < (screenRect.size.height * 2.80)
                 && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.345))) {
           BOB_LEFT_MARGIN = ver_3_left;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 2.065)
                 && topmargin < (screenRect.size.height * 3.10)
                 && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.745))) {
           BOB_LEFT_MARGIN = ver_5_left;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 2.065)
                 && topmargin < (screenRect.size.height * 2.90)
                 && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.895))) {
           BOB_LEFT_MARGIN = ver_6_left;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is mapRoad 3_1
   else if (isMaproad3_2) {
       
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 3.10))
           && (leftmargin > (int) ((screenRect.size.width * 1.465)) && leftmargin < (int) ((screenRect.size.width * 1.495)))) {
           BOB_LEFT_MARGIN = ver_4_left + 1;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 2.065)
                 && topmargin < (screenRect.size.height * 2.75)
                 && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.095))) {
           BOB_LEFT_MARGIN = ver_1_left + 1;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 2.715)
                 && topmargin < (screenRect.size.height * 2.905)
                 && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.245))) {
           BOB_LEFT_MARGIN = ver_2_left + 1;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 2.065)
                 && topmargin < (screenRect.size.height * 2.61)
                 && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.345))) {
           BOB_LEFT_MARGIN = ver_3_left + 1;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 1.93)
                 && topmargin < (screenRect.size.height * 2.75)
                 && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.745))) {
           BOB_LEFT_MARGIN = ver_5_left + 1;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 1.93)
                 && topmargin < (screenRect.size.height * 3.10)
                 && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.895))) {
           BOB_LEFT_MARGIN = ver_6_left + 1;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
   }// end of is mapRoad 3_2
   else if (isMaproad3_3) {
       
       // -----ver 4
       if ((topmargin > (screenRect.size.height * 1.93) && topmargin < (screenRect.size.height * 2.35))
           && (leftmargin > (int) ((screenRect.size.width * 2.465)) && leftmargin < (int) ((screenRect.size.width * 2.495)))) {
           BOB_LEFT_MARGIN = ver_4_left + 2;
           isValidMove=true;
       }
       // -----ver 1
       else if ((topmargin > (screenRect.size.height * 2.065)
                 && topmargin < (screenRect.size.height * 2.85)
                 && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.095))) {
           BOB_LEFT_MARGIN = ver_1_left + 2;
           isValidMove=true;
       }
       // -----ver 2
       else if ((topmargin > (screenRect.size.height * 2.715)
                 && topmargin < (screenRect.size.height * 2.90)
                 && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.245))) {
           BOB_LEFT_MARGIN = ver_2_left + 2;
           isValidMove=true;
       }
       // -----ver 3
       else if ((topmargin > (screenRect.size.height * 2.185)
                 && topmargin < (screenRect.size.height * 3.10)
                 && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.345))) {
           BOB_LEFT_MARGIN = ver_3_left + 2;
           isValidMove=true;
       }
       // -----ver 5
       else if ((topmargin > (screenRect.size.height * 2.065)
                 && topmargin < (screenRect.size.height * 3.10)
                 && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.745))) {
           BOB_LEFT_MARGIN = ver_5_left + 2;
           isValidMove=true;
       }
       // -----ver 6
       else if ((topmargin > (screenRect.size.height * 1.93)
                 && topmargin < (screenRect.size.height * 2.50)
                 && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.895))) {
           BOB_LEFT_MARGIN = ver_6_left + 2;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
   }// end of is mapRoad 3_3
    
    if(isValidMove==false){
        isGAMEOVER = true;
        [self pickImages];
    }
}
-(void)MoveRight:(CGFloat )leftmargin :(CGFloat)topmargin {
     CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveRight");

   if (isMaproad1_1) {
       if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 0.98)) {
           isMaproad1_1 = false;
           isMaproad1_2 = true;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }

        // -----hor 5
        if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.495))
            && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 1.20)))) {
            BOB_T0P_MARGIN = hor_5_top;
            isValidMove=true;
        }
        // -----hor 1
        else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.095))
                 && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
            BOB_T0P_MARGIN = hor_1_top;
            isValidMove=true;
        }
        // -----hor 2
        else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.215))
                 && (leftmargin > ((screenRect.size.width * 0.165)) && leftmargin < ((screenRect.size.width * 1.20)))) {
            BOB_T0P_MARGIN = hor_2_top;
            isValidMove=true;
        }
        // -----hor 3
        else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.295))
                 && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.76)))) {
            BOB_T0P_MARGIN = hor_3_top;
            isValidMove=true;
        }
        // -----hor 4
        else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.395))
                 && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
            BOB_T0P_MARGIN = hor_4_top;
            isValidMove=true;
        }
        // -----hor 6
        else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.645))
                 && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.51)))) {
            BOB_T0P_MARGIN = hor_6_top;
            isValidMove=true;
        }
        // -----hor 7
        else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.745))
                 && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 1.20)))) {
            BOB_T0P_MARGIN = hor_7_top;
            isValidMove=true;
        }
        // -----hor 8
        else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.895))
                 && (leftmargin > ((screenRect.size.width * 0.415)) && leftmargin < ((screenRect.size.width * 0.91)))) {
            BOB_T0P_MARGIN = hor_8_top;
            isValidMove=true;
        }else {
            isGAMEOVER = true;
            [self pickImages];
        }
       
       
        
   }// end of is Map Road 1_1
   else if (isMaproad2_1) {
       if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 0.93)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = true;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.495))
           && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.91)))) {
           BOB_T0P_MARGIN = hor_5_top + 1;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.095))
                && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
           BOB_T0P_MARGIN = hor_1_top + 1;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.215))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.83)))) {
           BOB_T0P_MARGIN = hor_2_top + 1;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.295))
                && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 1.10)))) {
           BOB_T0P_MARGIN = hor_3_top + 1;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.395))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.36)))) {
           BOB_T0P_MARGIN = hor_4_top + 1;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.645))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
           BOB_T0P_MARGIN = hor_6_top + 1;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.745))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
           BOB_T0P_MARGIN = hor_7_top + 1;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.895))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
           BOB_T0P_MARGIN = hor_8_top + 1;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 2_1
   else if (isMaproad1_2) {
       
    if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 1.96)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = true;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.495))
           && (leftmargin > (screenRect.size.width * 0.95) && leftmargin < ((screenRect.size.width * 1.90)))) {
           BOB_T0P_MARGIN = hor_5_top;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.095))
                && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 2.10)))) {
           BOB_T0P_MARGIN = hor_1_top;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.215))
                && (leftmargin > ((screenRect.size.width * 0.96)) && leftmargin < ((screenRect.size.width * 1.91)))) {
           BOB_T0P_MARGIN = hor_2_top;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.295))
                && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.35)))) {
           BOB_T0P_MARGIN = hor_3_top;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.395))
                && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.51)))) {
           BOB_T0P_MARGIN = hor_4_top;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.645))
                && (leftmargin > ((screenRect.size.width * 1.565)) && leftmargin < ((screenRect.size.width * 2.10)))) {
           BOB_T0P_MARGIN = hor_6_top;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.745))
                && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.90)))) {
           BOB_T0P_MARGIN = hor_7_top;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.895))
                && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
           BOB_T0P_MARGIN = hor_8_top;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 1_2
   else if (isMaproad2_2) {
       if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 1.96)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = true;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.495))
           && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
           BOB_T0P_MARGIN = hor_5_top + 1;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.095))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
           BOB_T0P_MARGIN = hor_1_top + 1;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.215))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
           BOB_T0P_MARGIN = hor_2_top + 1;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.295))
                && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.25)))) {
           BOB_T0P_MARGIN = hor_3_top + 1;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.395))
                && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 1.905)))) {
           BOB_T0P_MARGIN = hor_4_top + 1;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.645))
                && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
           BOB_T0P_MARGIN = hor_6_top + 1;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.745))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
           BOB_T0P_MARGIN = hor_7_top + 1;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.895))
                && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
           BOB_T0P_MARGIN = hor_8_top + 1;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 2_2
   else if (isMaproad1_3) {
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.495))
           && (leftmargin > (screenRect.size.width * 2.315) && leftmargin < ((screenRect.size.width * 3.10)))) {
           BOB_T0P_MARGIN = hor_5_top;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.095))
                && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.91)))) {
           BOB_T0P_MARGIN = hor_1_top;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.215))
                && (leftmargin > ((screenRect.size.width * 2.46)) && leftmargin < ((screenRect.size.width * 2.91)))) {
           BOB_T0P_MARGIN = hor_2_top;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.295))
                && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.60)))) {
           BOB_T0P_MARGIN = hor_3_top;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.395))
                && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.51)))) {
           BOB_T0P_MARGIN = hor_4_top;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.645))
                && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
           BOB_T0P_MARGIN = hor_6_top;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.745))
                && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
           BOB_T0P_MARGIN = hor_7_top;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.895))
                && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
           BOB_T0P_MARGIN = hor_8_top;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 1_3
   else if (isMaproad2_3) {
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.495))
           && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 2.90)))) {
           BOB_T0P_MARGIN = hor_5_top + 1;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.095))
                && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
           BOB_T0P_MARGIN = hor_1_top + 1;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.215))
                && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
           BOB_T0P_MARGIN = hor_2_top + 1;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.295))
                && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 3.10)))) {
           BOB_T0P_MARGIN = hor_3_top + 1;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.395))
                && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
           BOB_T0P_MARGIN = hor_4_top + 1;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.645))
                && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
           BOB_T0P_MARGIN = hor_6_top + 1;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.745))
                && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.25)))) {
           BOB_T0P_MARGIN = hor_7_top + 1;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.895))
                && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
           BOB_T0P_MARGIN = hor_8_top + 1;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 2_3
   else if (isMaproad3_1) {
       if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 0.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = true;
           isMaproad3_3 = false;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.495))
           && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.90)))) {
           BOB_T0P_MARGIN = hor_5_top + 2;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.095))
                && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
           BOB_T0P_MARGIN = hor_1_top + 2;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.215))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.81)))) {
           BOB_T0P_MARGIN = hor_2_top + 2;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.295))
                && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 0.75)))) {
           BOB_T0P_MARGIN = hor_3_top + 2;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.395))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.35)))) {
           BOB_T0P_MARGIN = hor_4_top + 2;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.645))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.50)))) {
           BOB_T0P_MARGIN = hor_6_top + 2;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.745))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
           BOB_T0P_MARGIN = hor_7_top + 2;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.895))
                && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
           BOB_T0P_MARGIN = hor_8_top + 2;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 3_1
   else if (isMaproad3_2) {
       
       if ((screenRect.size.width * BOB_LEFT_MARGIN) > (screenRect.size.width * 1.95)) {
           isMaproad1_1 = false;
           isMaproad1_2 = false;
           isMaproad1_3 = false;
           isMaproad1_4 = false;
           isMaproad2_1 = false;
           isMaproad2_2 = false;
           isMaproad2_3 = false;
           isMaproad2_4 = false;
           isMaproad3_1 = false;
           isMaproad3_2 = false;
           isMaproad3_3 = true;
           isMaproad3_4 = false;
           isMaproad4_1 = false;
           isMaproad4_2 = false;
           isMaproad4_3 = false;
           isMaproad4_4 = false;
       }
       
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.495))
           && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
           BOB_T0P_MARGIN = hor_5_top + 2;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.095))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
           BOB_T0P_MARGIN = hor_1_top + 2;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.215))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.51)))) {
           BOB_T0P_MARGIN = hor_2_top + 2;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.295))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.35)))) {
           BOB_T0P_MARGIN = hor_3_top + 2;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.395))
                && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 2.10)))) {
           BOB_T0P_MARGIN = hor_4_top + 2;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.645))
                && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
           BOB_T0P_MARGIN = hor_6_top + 2;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.745))
                && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
           BOB_T0P_MARGIN = hor_7_top + 2;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.895))
                && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.51)))) {
           BOB_T0P_MARGIN = hor_8_top + 2;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 3_2
   else if (isMaproad3_3) {
       // -----hor 5
       if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.495))
           && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 3.10)))) {
           BOB_T0P_MARGIN = hor_5_top + 2;
           isValidMove=true;
       }
       // -----hor 1
       else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.095))
                && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
           BOB_T0P_MARGIN = hor_1_top + 2;
           isValidMove=true;
       }
       // -----hor 2
       else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.215))
                && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.40)))) {
           BOB_T0P_MARGIN = hor_2_top + 2;
           isValidMove=true;
       }
       // -----hor 3
       else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.295))
                && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.80)))) {
           BOB_T0P_MARGIN = hor_3_top + 2;
           isValidMove=true;
       }
       // -----hor 4
       else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.395))
                && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.75)))) {
           BOB_T0P_MARGIN = hor_4_top + 2;
           isValidMove=true;
       }
       // -----hor 6
       else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.645))
                && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.80)))) {
           BOB_T0P_MARGIN = hor_6_top + 2;
           isValidMove=true;
       }
       // -----hor 7
       else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.745))
                && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.26)))) {
           BOB_T0P_MARGIN = hor_7_top + 2;
           isValidMove=true;
       }
       // -----hor 8
       else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.895))
                && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 3.10)))) {
           BOB_T0P_MARGIN = hor_8_top + 2;
           isValidMove=true;
       } else {
           isGAMEOVER = true;
           [self pickImages];

       }
       
   }// end of is Map Road 3_3
    if(isValidMove==false){
        isGAMEOVER = true;
        [self pickImages];
    }
}
-(void)MoveUp:(CGFloat )leftmargin :(CGFloat)topmargin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveUp");

    if (isMaproad1_1) {
        // -----ver 4
    if ((topmargin > (screenRect.size.height * 0.02) && topmargin < (screenRect.size.height * 1.20))
        && (leftmargin > (int) ((screenRect.size.width * 0.465)) && leftmargin < (int) ((screenRect.size.width * 0.495)))) {
        BOB_LEFT_MARGIN = ver_4_left;
        isValidMove=true;
    }
    // -----ver 1
    else if ((topmargin > (screenRect.size.height * 0.02)
              && topmargin < (screenRect.size.height * 0.76)
              && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.095))) {
        BOB_LEFT_MARGIN = ver_1_left;
        isValidMove=true;
    }
    // -----ver 2
    else if ((topmargin > (screenRect.size.height * 0.61)
              && topmargin < (screenRect.size.height * 0.76)
              && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
        BOB_LEFT_MARGIN = ver_2_left;
        isValidMove=true;
    }
    // -----ver 3
    else if ((topmargin > (screenRect.size.height * 0.07)
              && topmargin < (screenRect.size.height * 0.51)
              && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.345))) {
        BOB_LEFT_MARGIN = ver_3_left;
        isValidMove=true;
    }
    // -----ver 5
    else if ((topmargin > (screenRect.size.height * 0.06)
              && topmargin < (screenRect.size.height * 0.91)
              && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.745))) {
        BOB_LEFT_MARGIN = ver_5_left;
        isValidMove=true;
    }
    // -----ver 6
    else if ((topmargin > (screenRect.size.height * 0.06)
              && topmargin < (screenRect.size.height * 1.20)
              && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.895))) {
        BOB_LEFT_MARGIN = ver_6_left;
        isValidMove=true;
    } else {
        isGAMEOVER = true;
        [self pickImages];
    }
    
    }   // end of is mapRoad 1_1
        else if (isMaproad2_1) {
            
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 0.98)) {
                isMaproad1_1 = true;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.80) && topmargin < (screenRect.size.height * 1.91))
                && (leftmargin > (int) ((screenRect.size.width * 0.465)) && leftmargin < (int) ((screenRect.size.width * 0.495)))) {
                BOB_LEFT_MARGIN = ver_4_left;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 2.20)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.095))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.61)
                      && topmargin < (screenRect.size.height * 2.20)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 1.61)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.345))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 1.95)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.745))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.80)
                      && topmargin < (screenRect.size.height * 1.91)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.895))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            }  else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is mapRoad 2_1
        else if (isMaproad1_2) {
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 1.10))
                && (leftmargin > (int) ((screenRect.size.width * 1.465)) && leftmargin < (int) ((screenRect.size.width * 1.495)))) {
                BOB_LEFT_MARGIN = ver_4_left + 1;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.095))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.715)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.245))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.345))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 1.10)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.745))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.03)
                      && topmargin < (screenRect.size.height * 0.75)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.895))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 1_2
        
        else if (isMaproad2_2) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 0.98)) {
                isMaproad1_1 = false;
                isMaproad1_2 = true;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.93) && topmargin < (screenRect.size.height * 1.90))
                && (leftmargin > (int) ((screenRect.size.width * 1.465)) && leftmargin < (int) ((screenRect.size.width * 1.495)))) {
                BOB_LEFT_MARGIN = ver_4_left + 1;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.76)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.095))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.715)
                      && topmargin < (screenRect.size.height * 1.91)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.245))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.345))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.745))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.065)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.895))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            }  else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 2_2
        
        else if (isMaproad1_3) {
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 0.90))
                && (leftmargin > (int) ((screenRect.size.width * 2.465)) && leftmargin < (int) ((screenRect.size.width * 2.495)))) {
                BOB_LEFT_MARGIN = ver_4_left + 2;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 1.20)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.095))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.715)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.245))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.61)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.345))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.065)
                      && topmargin < (screenRect.size.height * 1.10)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.745))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.065)
                      && topmargin < (screenRect.size.height * 0.81)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.895))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            }  else {
                isGAMEOVER = true;
                [self pickImages];
            }
        }// end of is mapRoad 1_3
        else if (isMaproad2_3) {
            
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 0.98)
                && (screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.94)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = true;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 2.10))
                && (leftmargin > (int) ((screenRect.size.width * 2.465)) && leftmargin < (int) ((screenRect.size.width * 2.495)))) {
                BOB_LEFT_MARGIN = ver_4_left + 2;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 1.75)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.095))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.715)
                      && topmargin < (screenRect.size.height * 1.90)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.245))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.60)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.345))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 1.90)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.745))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.065)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.895))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            }  else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 2_3
        else if (isMaproad3_1) {
            
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 2)
                && (screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.94)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = true;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 2.01) && topmargin < (screenRect.size.height * 3.10))
                && (leftmargin > (int) ((screenRect.size.width * 0.465)) && leftmargin < (int) ((screenRect.size.width * 0.495)))) {
                BOB_LEFT_MARGIN = ver_4_left;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.095))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.35)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.245))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.265)
                      && topmargin < (screenRect.size.height * 2.80)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.345))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.745))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.895))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            }  else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is mapRoad 3_1
        else if (isMaproad3_2) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 1.99)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = true;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 3.10))
                && (leftmargin > (int) ((screenRect.size.width * 1.465)) && leftmargin < (int) ((screenRect.size.width * 1.495)))) {
                BOB_LEFT_MARGIN = ver_4_left + 1;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.75)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.095))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 2.715)
                      && topmargin < (screenRect.size.height * 2.905)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.245))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.345))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.75)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.745))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.895))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 3_2
        else if (isMaproad3_3) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 2)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = true;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 1.93) && topmargin < (screenRect.size.height * 2.35))
                && (leftmargin > (int) ((screenRect.size.width * 2.465)) && leftmargin < (int) ((screenRect.size.width * 2.495)))) {
                BOB_LEFT_MARGIN = ver_4_left + 2;
                isValidMove=true;
            }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.85)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.095))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 2.715)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.245))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.185)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.345))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.745))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.50)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.895))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];
            }
      
        }// end of is mapRoad 3_3
        
    if(isValidMove==false){
            isGAMEOVER = true;
        [self pickImages];
    }
    
}

-(void)MoveUP_Right_to_Left:(CGFloat )leftmargin :(CGFloat)topmargin{
    //NSLog(@"MoveUP_Right_to_Left");

    CGRect screenRect = [[UIScreen mainScreen] bounds];

        if (isMaproad1_1) {
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.02) && topmargin < (screenRect.size.height * 1.20))
                && (leftmargin > (int) ((screenRect.size.width * 0.465))
                    &&leftmargin < (int) ((screenRect.size.width * 0.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.02)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.135))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.61)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.285))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.51)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.385))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.06)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.785))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.06)
                      && topmargin < (screenRect.size.height * 1.20)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.935))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }
    // end of is mapRoad 1_1
        else if (isMaproad2_1) {
            
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 0.98)) {
                isMaproad1_1 = true;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.80) && topmargin < (screenRect.size.height * 1.91))
                && (leftmargin > (int) ((screenRect.size.width * 0.465))
                    && leftmargin < (int) ((screenRect.size.width * 0.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 2.20)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.135))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.61)
                      && topmargin < (screenRect.size.height * 2.20)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.285))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 1.61)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.385))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 1.06)
                      && topmargin < (screenRect.size.height * 1.95)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.785))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.80)
                      && topmargin < (screenRect.size.height * 1.91)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.935))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is mapRoad 2_1
        else if (isMaproad1_2) {
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 1.10))
                && (leftmargin > (int) ((screenRect.size.width * 1.465))
                    && leftmargin < (int) ((screenRect.size.width * 1.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 1;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.76)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.715)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 1.10)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.03)
                      && topmargin < (screenRect.size.height * 0.75)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 1_2
        
        else if (isMaproad2_2) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 0.98)) {
                isMaproad1_1 = false;
                isMaproad1_2 = true;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.93) && topmargin < (screenRect.size.height * 1.90))
                && (leftmargin > (int) ((screenRect.size.width * 1.465))
                    && leftmargin < (int) ((screenRect.size.width * 1.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 1;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.76)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.715)
                      && topmargin < (screenRect.size.height * 1.91)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.065)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
        }// end of is mapRoad 2_2
        
        else if (isMaproad1_3) {
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 0.07) && topmargin < (screenRect.size.height * 0.90))
                && (leftmargin > (int) ((screenRect.size.width * 2.465))
                    && leftmargin < (int) ((screenRect.size.width * 2.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 2;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 1.20)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 0.715)
                      && topmargin < (screenRect.size.height * 0.91)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 0.07)
                      && topmargin < (screenRect.size.height * 0.61)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.065)
                      && topmargin < (screenRect.size.height * 1.10)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 0.065)
                      && topmargin < (screenRect.size.height * 0.81)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 1_3
        else if (isMaproad2_3) {
            
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 0.98)
                && (screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 0.94)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = true;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 2.10))
                && (leftmargin > (int) ((screenRect.size.width * 2.465))
                    && leftmargin < (int) ((screenRect.size.width * 2.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 2;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 1.75)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.715)
                      && topmargin < (screenRect.size.height * 1.90)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 1.07)
                      && topmargin < (screenRect.size.height * 1.60)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 0.93)
                      && topmargin < (screenRect.size.height * 1.90)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.065)
                      && topmargin < (screenRect.size.height * 2.10)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
        }// end of is mapRoad 2_3
        else if (isMaproad3_1) {
            
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 2)
                && (screenRect.size.height * BOB_T0P_MARGIN) > (screenRect.size.height * 1.94)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = true;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 2.01) && topmargin < (screenRect.size.height * 3.10))
                && (leftmargin > (int) ((screenRect.size.width * 0.465))
                    && leftmargin < (int) ((screenRect.size.width * 0.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > ((screenRect.size.width * 0.065))) && leftmargin < (screenRect.size.width * 0.135))) {
                BOB_LEFT_MARGIN = ver_1_left;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.35)
                      && (leftmargin > (screenRect.size.width * 0.215)) && leftmargin < (screenRect.size.width * 0.285))) {
                BOB_LEFT_MARGIN = ver_2_left;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.265)
                      && topmargin < (screenRect.size.height * 2.80)
                      && (leftmargin > (screenRect.size.width * 0.315)) && leftmargin < (screenRect.size.width * 0.385))) {
                BOB_LEFT_MARGIN = ver_3_left;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 0.715)) && leftmargin < (screenRect.size.width * 0.785))) {
                BOB_LEFT_MARGIN = ver_5_left;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > (screenRect.size.width * 0.865)) && leftmargin < (screenRect.size.width * 0.935))) {
                BOB_LEFT_MARGIN = ver_6_left;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is mapRoad 3_1
        else if (isMaproad3_2) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 1.99)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = true;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 3.10))
                && (leftmargin > (int) ((screenRect.size.width * 1.465)) 
                    && leftmargin < (int) ((screenRect.size.width * 1.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 1;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.75)
                      && (leftmargin > ((screenRect.size.width * 1.065))) && leftmargin < (screenRect.size.width * 1.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 1;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 2.715)
                      && topmargin < (screenRect.size.height * 2.905)
                      && (leftmargin > (screenRect.size.width * 1.215)) && leftmargin < (screenRect.size.width * 1.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 1;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.61)
                      && (leftmargin > (screenRect.size.width * 1.315)) && leftmargin < (screenRect.size.width * 1.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 1;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.75)
                      && (leftmargin > (screenRect.size.width * 1.715)) && leftmargin < (screenRect.size.width * 1.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 1;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 1.865)) && leftmargin < (screenRect.size.width * 1.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
        }// end of is mapRoad 3_2
        else if (isMaproad3_3) {
            if ((screenRect.size.height * BOB_T0P_MARGIN) < (screenRect.size.height * 2)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = true;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----ver 4
            if ((topmargin > (screenRect.size.height * 1.93) && topmargin < (screenRect.size.height * 2.35))
                && (leftmargin > (int) ((screenRect.size.width * 2.465)) 
                    && leftmargin < (int) ((screenRect.size.width * 2.535)))) {
                    BOB_LEFT_MARGIN = ver_4_left + 2;
                    isValidMove=true;
                }
            // -----ver 1
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 2.85)
                      && (leftmargin > ((screenRect.size.width * 2.065))) && leftmargin < (screenRect.size.width * 2.135))) {
                BOB_LEFT_MARGIN = ver_1_left + 2;
                isValidMove=true;
            }
            // -----ver 2
            else if ((topmargin > (screenRect.size.height * 2.715)
                      && topmargin < (screenRect.size.height * 2.90)
                      && (leftmargin > (screenRect.size.width * 2.215)) && leftmargin < (screenRect.size.width * 2.285))) {
                BOB_LEFT_MARGIN = ver_2_left + 2;
                isValidMove=true;
            }
            // -----ver 3
            else if ((topmargin > (screenRect.size.height * 2.185)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 2.315)) && leftmargin < (screenRect.size.width * 2.385))) {
                BOB_LEFT_MARGIN = ver_3_left + 2;
                isValidMove=true;
            }
            // -----ver 5
            else if ((topmargin > (screenRect.size.height * 2.065)
                      && topmargin < (screenRect.size.height * 3.10)
                      && (leftmargin > (screenRect.size.width * 2.715)) && leftmargin < (screenRect.size.width * 2.785))) {
                BOB_LEFT_MARGIN = ver_5_left + 2;
                isValidMove=true;
            }
            // -----ver 6
            else if ((topmargin > (screenRect.size.height * 1.93)
                      && topmargin < (screenRect.size.height * 2.50)
                      && (leftmargin > (screenRect.size.width * 2.865)) && leftmargin < (screenRect.size.width * 2.935))) {
                BOB_LEFT_MARGIN = ver_6_left + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];
            }
        }// end of is mapRoad 3_3
    
    if(isValidMove==false){
            isGAMEOVER = true;
    [self pickImages];
    }
           // setMargins(BOB_IMAGE, BOB_LEFT_MARGIN, BOB_T0P_MARGIN-=0.0037,-6, -6);
    
}
-(void)MoveLeft:(CGFloat )leftmargin :(CGFloat)topmargin{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveLeft");

        if (isMaproad1_1) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.495))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.095))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.215))
                     && (leftmargin > ((screenRect.size.width * 0.165)) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.295))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.76)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.395))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.645))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.51)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.745))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.895))
                     && (leftmargin > ((screenRect.size.width * 0.415)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }
    // end of is Map Road 1_1
        else if (isMaproad2_1) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.495))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.095))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.215))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.83)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.295))
                     && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.395))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.36)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.645))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.745))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.895))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 2_1
        else if (isMaproad1_2) {
            
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width)) {
                isMaproad1_1 = true;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.495))
                && (leftmargin > (screenRect.size.width * 0.96) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.095))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.215))
                     && (leftmargin > ((screenRect.size.width * 0.96)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.295))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.35)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.395))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.645))
                     && (leftmargin > ((screenRect.size.width * 1.565)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.745))
                     && (leftmargin > ((screenRect.size.width * 0.96)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.895))
                     && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 1_2
        else if (isMaproad2_2) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = true;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.495))
                && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.095))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.215))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.295))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.25)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.395))
                     && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 1.905)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.645))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.745))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.895))
                     && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 2_2
        
        else if (isMaproad1_3) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width * 2)) {
                isMaproad1_1 = false;
                isMaproad1_2 = true;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.495))
                && (leftmargin > (screenRect.size.width * 2.315) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.095))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.91)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.215))
                     && (leftmargin > ((screenRect.size.width * 2.46)) && leftmargin < ((screenRect.size.width * 2.91)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.295))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.60)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.395))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.51)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.645))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.745))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.895))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 1_3
        else if (isMaproad2_3) {
            
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width * 2)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = true;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.495))
                && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.095))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.215))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.295))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.395))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.645))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.745))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.25)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.895))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 2_3
        else if (isMaproad3_1) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.495))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.095))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.215))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.81)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.295))
                     && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 0.75)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.395))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.35)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.645))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.50)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.745))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.895))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 3_1
        else if (isMaproad3_2) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = true;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.495))
                && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.095))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.215))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.295))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.35)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.395))
                     && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.645))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.745))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.895))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is Map Road 3_2
        else if (isMaproad3_3) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width * 1.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = true;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.495))
                && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.095))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.215))
                     && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.295))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.80)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.395))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.645))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.80)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.745))
                     && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.26)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.895))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];
            }
            
        }// end of is Map Road 3_3
        
    
    if(isValidMove==false){
              isGAMEOVER = true;
        [self pickImages];
    }
            //setMargins(BOB_IMAGE, BOB_LEFT_MARGIN -= 0.0057, BOB_T0P_MARGIN,-6, -6);
}
-(void)MoveLeftDown_to_up:(CGFloat )leftmargin :(CGFloat)topmargin{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //NSLog(@"MoveLeftDown_to_up");
        if (isMaproad1_1) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.535))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.135))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.255))
                     && (leftmargin > ((screenRect.size.width * 0.165)) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.335))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.76)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.435))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.685))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.51)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.785))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 1.20)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.935))
                     && (leftmargin > ((screenRect.size.width * 0.415)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is Map Road 1_1
        else if (isMaproad2_1) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.535))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.135))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.255))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.83)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.335))
                     && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.435))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.36)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.685))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.785))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.935))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 2_1
        else if (isMaproad1_2) {
            
           if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width)) {
                isMaproad1_1 = true;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.535))
                && (leftmargin > (screenRect.size.width * 0.96) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.135))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.255))
                     && (leftmargin > ((screenRect.size.width * 0.96)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.335))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.35)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.435))
                     && (leftmargin > ((screenRect.size.width * 1.06)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.685))
                     && (leftmargin > ((screenRect.size.width * 1.565)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.785))
                     && (leftmargin > ((screenRect.size.width * 0.96)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.935))
                     && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 1_2
        else if (isMaproad2_2) {
        if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = true;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.535))
                && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.135))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.255))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.335))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.25)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.435))
                     && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 1.905)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.685))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.785))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.935))
                     && (leftmargin > ((screenRect.size.width * 1.215)) && leftmargin < ((screenRect.size.width * 1.75)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is Map Road 2_2
        
        else if (isMaproad1_3) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width * 2)) {
                isMaproad1_1 = false;
                isMaproad1_2 = true;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 0.465) && topmargin < (screenRect.size.height * 0.535))
                && (leftmargin > (screenRect.size.width * 2.315) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_5_top;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 0.065) && topmargin < (screenRect.size.height * 0.135))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.91)))) {
                BOB_T0P_MARGIN = hor_1_top;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 0.185) && topmargin < (screenRect.size.height * 0.255))
                     && (leftmargin > ((screenRect.size.width * 2.46)) && leftmargin < ((screenRect.size.width * 2.91)))) {
                BOB_T0P_MARGIN = hor_2_top;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 0.265) && topmargin < (screenRect.size.height * 0.335))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.60)))) {
                BOB_T0P_MARGIN = hor_3_top;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 0.365) && topmargin < (screenRect.size.height * 0.435))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.51)))) {
                BOB_T0P_MARGIN = hor_4_top;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 0.615) && topmargin < (screenRect.size.height * 0.685))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_6_top;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 0.715) && topmargin < (screenRect.size.height * 0.785))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_7_top;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 0.865) && topmargin < (screenRect.size.height * 0.935))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_8_top;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 1_3
        else if (isMaproad2_3) {
            
           if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width * 2)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = true;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 1.465) && topmargin < (screenRect.size.height * 1.535))
                && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 1;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 1.065) && topmargin < (screenRect.size.height * 1.135))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 1;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 1.185) && topmargin < (screenRect.size.height * 1.255))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_2_top + 1;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 1.265) && topmargin < (screenRect.size.height * 1.335))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_3_top + 1;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 1.365) && topmargin < (screenRect.size.height * 1.435))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_4_top + 1;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 1.615) && topmargin < (screenRect.size.height * 1.685))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_6_top + 1;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 1.715) && topmargin < (screenRect.size.height * 1.785))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.25)))) {
                BOB_T0P_MARGIN = hor_7_top + 1;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 1.865) && topmargin < (screenRect.size.height * 1.935))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_8_top + 1;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
 [self pickImages];            }
            
        }// end of is Map Road 2_3
        else if (isMaproad3_1) {
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.535))
                && (leftmargin > (screenRect.size.width * 0.06) && leftmargin < ((screenRect.size.width * 0.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.135))
                     && (leftmargin > ((screenRect.size.width * 0.06)) && leftmargin < ((screenRect.size.width * 0.91)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.255))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.81)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.335))
                     && (leftmargin > ((screenRect.size.width * 0.215)) && leftmargin < ((screenRect.size.width * 0.75)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.435))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.35)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.685))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 0.50)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.785))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.935))
                     && (leftmargin > ((screenRect.size.width * 0.065)) && leftmargin < ((screenRect.size.width * 1.10)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is Map Road 3_1
        else if (isMaproad3_2) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = true;
                isMaproad3_2 = false;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.535))
                && (leftmargin > (screenRect.size.width * 1.065) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.135))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.255))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.335))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 1.35)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.435))
                     && (leftmargin > ((screenRect.size.width * 1.465)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.685))
                     && (leftmargin > ((screenRect.size.width * 1.065)) && leftmargin < ((screenRect.size.width * 2.10)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.785))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.40)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.935))
                     && (leftmargin > ((screenRect.size.width * 0.93)) && leftmargin < ((screenRect.size.width * 1.51)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
[self pickImages];            }
            
        }// end of is Map Road 3_2
        else if (isMaproad3_3) {
            if ((screenRect.size.width * BOB_LEFT_MARGIN) < (screenRect.size.width * 1.95)) {
                isMaproad1_1 = false;
                isMaproad1_2 = false;
                isMaproad1_3 = false;
                isMaproad1_4 = false;
                isMaproad2_1 = false;
                isMaproad2_2 = false;
                isMaproad2_3 = false;
                isMaproad2_4 = false;
                isMaproad3_1 = false;
                isMaproad3_2 = true;
                isMaproad3_3 = false;
                isMaproad3_4 = false;
                isMaproad4_1 = false;
                isMaproad4_2 = false;
                isMaproad4_3 = false;
                isMaproad4_4 = false;
            }
            
            // -----hor 5
            if ((topmargin > (screenRect.size.height * 2.465) && topmargin < (screenRect.size.height * 2.535))
                && (leftmargin > (screenRect.size.width * 2.185) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_5_top + 2;
                isValidMove=true;
            }
            // -----hor 1
            else if ((topmargin > (screenRect.size.height * 2.065) && topmargin < (screenRect.size.height * 2.135))
                     && (leftmargin > ((screenRect.size.width * 2.065)) && leftmargin < ((screenRect.size.width * 2.90)))) {
                BOB_T0P_MARGIN = hor_1_top + 2;
                isValidMove=true;
            }
            // -----hor 2
            else if ((topmargin > (screenRect.size.height * 2.185) && topmargin < (screenRect.size.height * 2.255))
                     && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.40)))) {
                BOB_T0P_MARGIN = hor_2_top + 2;
                isValidMove=true;
            }
            // -----hor 3
            else if ((topmargin > (screenRect.size.height * 2.265) && topmargin < (screenRect.size.height * 2.335))
                     && (leftmargin > ((screenRect.size.width * 2.315)) && leftmargin < ((screenRect.size.width * 2.80)))) {
                BOB_T0P_MARGIN = hor_3_top + 2;
                isValidMove=true;
            }
            // -----hor 4
            else if ((topmargin > (screenRect.size.height * 2.365) && topmargin < (screenRect.size.height * 2.435))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.75)))) {
                BOB_T0P_MARGIN = hor_4_top + 2;
                isValidMove=true;
            }
            // -----hor 6
            else if ((topmargin > (screenRect.size.height * 2.615) && topmargin < (screenRect.size.height * 2.685))
                     && (leftmargin > ((screenRect.size.width * 1.93)) && leftmargin < ((screenRect.size.width * 2.80)))) {
                BOB_T0P_MARGIN = hor_6_top + 2;
                isValidMove=true;
            }
            // -----hor 7
            else if ((topmargin > (screenRect.size.height * 2.715) && topmargin < (screenRect.size.height * 2.785))
                     && (leftmargin > ((screenRect.size.width * 1.99)) && leftmargin < ((screenRect.size.width * 2.26)))) {
                BOB_T0P_MARGIN = hor_7_top + 2;
                isValidMove=true;
            }
            // -----hor 8
            else if ((topmargin > (screenRect.size.height * 2.865) && topmargin < (screenRect.size.height * 2.935))
                     && (leftmargin > ((screenRect.size.width * 2.215)) && leftmargin < ((screenRect.size.width * 3.10)))) {
                BOB_T0P_MARGIN = hor_8_top + 2;
                isValidMove=true;
            } else {
                isGAMEOVER = true;
                [self pickImages];
            }
            
        }// end of is Map Road 3_3
    if(isValidMove==false){
            isGAMEOVER = true;
    [self pickImages];
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
