//
//  HomeViewController.m
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+Expanded.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize roadView,mainscrollview,leftgreenImg,topgreenImg,rightwaterImg,downwaterImg,insideFirstImg,insideFirstImg1,insideFirstImg2,insideFirstImg3,insideFirstImg4,bobImg,simamImg,simonArray,marginVO,timer,ywidthbobTop,ywidthsimLeft,BOB_LEFT_MARGIN,BOB_T0P_MARGIN,isMovingUp,isMovingDown,isMovingLeft,isMovingRight,indexvalue,position,startPosition,SIMAN_LEFT_MARGIN,SIMAN_T0P_MARGIN,hor_1_top ,hor_2_top ,hor_3_top,hor_4_top,hor_5_top,hor_6_top,hor_7_top,hor_8_top,ver_1_left,ver_2_left,ver_3_left,ver_4_left,ver_5_left,ver_6_left,isValidMove,isGAMEOVER,isMaproad1_1,isMaproad1_2,isMaproad1_3,isMaproad1_4,isMaproad2_1,isMaproad2_2,isMaproad2_3,isMaproad2_4,isMaproad3_1,isMaproad3_2,isMaproad3_3,isMaproad3_4,isMaproad4_1,isMaproad4_2,isMaproad4_3,isMaproad4_4,isPause,isSimanMove,isWait,isBottom_to_Top,isTop_to_Bottom,isLeft_to_Right,isRight_to_Left,ywidth,yheights;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    simonArray=[[NSMutableArray alloc]init];
    isMovingDown=NO;
    isMovingLeft=NO;
    isMovingRight=NO;
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
    ver_3_left = 0.33,
    ver_4_left = 0.48;
    ver_5_left = 0.73;
    ver_6_left = 0.88;
    isGAMEOVER=false;
    isValidMove=true;
    isPause=false;
    isSimanMove=false;
    isWait=false;
    isBottom_to_Top=true;isTop_to_Bottom=false;isLeft_to_Right=true;isRight_to_Left=false;
    isMaproad1_1 = true;
    isMaproad1_2 = false;
    isMaproad1_3 = false;
    isMaproad1_4 = false; isMaproad2_1 = false;
    isMaproad2_2 = true; isMaproad2_3 = false; isMaproad2_4 = false;
    isMaproad3_1 = false; isMaproad3_2 = false; isMaproad3_3 = false;
    isMaproad3_4 = false; isMaproad4_1 = false; isMaproad4_2 = false;
    isMaproad4_3 = false; isMaproad4_4= false;
    //map road 1 row 1 column
    //horizontally map design code
    self.view.backgroundColor=[UIColor colorWithHexString:@"d2be96"];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
     ywidth = screenRect.size.width;
     yheights = screenRect.size.height;
    
    
    //water and green image set in background of map
    CGFloat imgwidth = (screenRect.size.width*0.10);
    CGFloat imgheight = (screenRect.size.height*3.5);

    leftgreenImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, -20, imgwidth,imgheight)];
    [leftgreenImg setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:leftgreenImg];
    
    topgreenImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,-20,screenRect.size.width*4.5,(screenRect.size.height*0.10)+20)];
    [topgreenImg setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    [self.mainscrollview addSubview:topgreenImg];

    rightwaterImg=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*2.93),(screenRect.size.height*1.0),screenRect.size.width*1.5,(screenRect.size.height*3.0) )];
    [rightwaterImg setBackgroundColor:[UIColor colorWithHexString:@"beebfe"]];
    //[self.mainscrollview addSubview:rightwaterImg];

    downwaterImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,(screenRect.size.height*2.920),screenRect.size.width*3.5,(screenRect.size.height*1.5) )];
    [downwaterImg setBackgroundColor:[UIColor colorWithHexString:@"beebfe"]];
    //[self.mainscrollview addSubview:downwaterImg];
    
    insideFirstImg=[[UIImageView alloc]initWithFrame:CGRectMake(0,(screenRect.size.height*0.77),(screenRect.size.width*0.50),(screenRect.size.height*0.35) )];
    [insideFirstImg setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    //[self.mainscrollview addSubview:insideFirstImg];

    insideFirstImg1=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*0.93),(screenRect.size.height*0.75),(screenRect.size.width*0.32),(screenRect.size.height*0.35) )];
    [insideFirstImg1 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    //[self.mainscrollview addSubview:insideFirstImg1];

    insideFirstImg2=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*1.20),(screenRect.size.height*0.90),(screenRect.size.width*0.32),(screenRect.size.height*0.20) )];
    [insideFirstImg2 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    //[self.mainscrollview addSubview:insideFirstImg2];

    insideFirstImg3=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*0.10),(screenRect.size.height*1.50),(screenRect.size.width*0.44),(screenRect.size.height*0.15) )];
    [insideFirstImg3 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
   // [self.mainscrollview addSubview:insideFirstImg3];

    insideFirstImg4=[[UIImageView alloc]initWithFrame:CGRectMake((screenRect.size.width*0.27),(screenRect.size.height*1.92),(screenRect.size.width*0.67),(screenRect.size.height*0.20) )];
    [insideFirstImg4 setBackgroundColor:[UIColor colorWithHexString:@"b5cd83"]];
    //[self.mainscrollview addSubview:insideFirstImg4];

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
       // [self.mainscrollview addSubview:roadView];
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
       // [self.mainscrollview addSubview:roadView];
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
        //[self.mainscrollview addSubview:roadView];
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
        //[self.mainscrollview addSubview:roadView];
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
       // [self.mainscrollview addSubview:roadView];
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
       // [self.mainscrollview addSubview:roadView];
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
        //[self.mainscrollview addSubview:roadView];
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
       // [self.mainscrollview addSubview:roadView];
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
       // [self.mainscrollview addSubview:roadView];
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
       // [self.mainscrollview addSubview:roadView];
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
      //  [self.mainscrollview addSubview:roadView];
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
      //  [self.mainscrollview addSubview:roadView];
    }
    BOB_T0P_MARGIN = 0.55;
    BOB_LEFT_MARGIN = 0.48;

    simamImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    [simamImg setImage:[UIImage imageNamed:@"simamimage.png"]];
    [self.mainscrollview addSubview:simamImg];

    bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    [bobImg setImage:[UIImage imageNamed:@"bobimage.png"]];
    [self.mainscrollview addSubview:bobImg];
    
    mainscrollview.contentSize = CGSizeMake(screenRect.size.width*4.0,screenRect.size.height*4.0);
    mainscrollview.scrollEnabled=NO;
    
    isMovingUp=YES;
    indexvalue=0;
    marginVO=[[MarginVO alloc]init];
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.02 target:self selector:@selector(DateFunction) userInfo:nil repeats: YES];

    
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

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
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
}-(void)DateFunction{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [bobImg removeFromSuperview];
    [simamImg removeFromSuperview];
    if (isGAMEOVER==false) {
    CGFloat leftmargin = (CGFloat) ((screenRect.size.width) * BOB_LEFT_MARGIN);
    CGFloat topmargin = (CGFloat) ((screenRect.size.height) * BOB_T0P_MARGIN);

    if (isMovingUp==YES) {
        /*if(isLeft_to_Right)
            [self MoveUp:leftmargin :topmargin];
        else
           [self MoveUP_Right_to_Left:leftmargin: topmargin];
*/
        [self MoveUp:leftmargin :topmargin];

            BOB_T0P_MARGIN=BOB_T0P_MARGIN-0.003;
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights
                                                                , screenRect.size.height*0.05,screenRect.size.height*0.05)];
            
    }else if (isMovingLeft==YES) {
        /*if(isTop_to_Bottom)
           [self MoveLeft:leftmargin :topmargin];
        else
           [self MoveLeftDown_to_up:leftmargin :topmargin];
*/
        [self MoveLeft:leftmargin :topmargin];
        BOB_LEFT_MARGIN=BOB_LEFT_MARGIN-0.005;
            //BOB_LEFT_MARGIN=BOB_LEFT_MARGIN-(screenRect.size.width*0.006);
            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    }else if (isMovingRight==YES) {
           //BOB_LEFT_MARGIN=BOB_LEFT_MARGIN+(screenRect.size.width*0.006);
        [self MoveRight:leftmargin :topmargin];

        BOB_LEFT_MARGIN=BOB_LEFT_MARGIN+0.005;

            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    }else if (isMovingDown==YES) {
           // BOB_T0P_MARGIN=BOB_T0P_MARGIN+(screenRect.size.height*0.003);
        BOB_T0P_MARGIN=BOB_T0P_MARGIN+0.003;

            bobImg=[[UIImageView alloc]initWithFrame:CGRectMake(BOB_LEFT_MARGIN*ywidth,BOB_T0P_MARGIN*yheights, screenRect.size.height*0.05,screenRect.size.height*0.05)];
    }
    [bobImg setImage:[UIImage imageNamed:@"bobimage.png"]];
    [self.mainscrollview addSubview:bobImg];
    marginVO=[[MarginVO alloc]init];
    marginVO.simLeftRight=[NSString stringWithFormat: @"%.4f", BOB_LEFT_MARGIN];
    marginVO.simTopDown=[NSString stringWithFormat: @"%.4f", BOB_T0P_MARGIN];
    [simonArray addObject:marginVO];
    
    
    if (simonArray.count>=50) {
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
}
-(void)MoveDown:(CGFloat )leftmargin :(CGFloat)topmargin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
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
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];

        }
    }
}
-(void)MoveRight:(CGFloat )leftmargin :(CGFloat)topmargin {
     CGRect screenRect = [[UIScreen mainScreen] bounds];
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
        }else {
            isGAMEOVER = true;
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
       
       
        
    }
}
-(void)MoveUp:(CGFloat )leftmargin :(CGFloat)topmargin {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
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
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    }/*   // end of is mapRoad 1_1
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
      
        }// end of is mapRoad 3_3
        */
        /*if(isValidMove)
            isGAMEOVER = false;

        else {
            isGAMEOVER = true;
           
        }*/
    
    
}

-(void)MoveUP_Right_to_Left:(CGFloat )leftmargin :(CGFloat)topmargin{
    
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }
    /*// end of is mapRoad 1_1
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }// end of is mapRoad 3_3
        */
        if(isValidMove)
            isGAMEOVER = false;

           // setMargins(BOB_IMAGE, BOB_LEFT_MARGIN, BOB_T0P_MARGIN-=0.0037,-6, -6);
        else {
            isGAMEOVER = true;
        }
        
    
}
-(void)MoveLeft:(CGFloat )leftmargin :(CGFloat)topmargin{
    CGRect screenRect = [[UIScreen mainScreen] bounds];

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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }/*
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }// end of is Map Road 3_3
        
        */
         /* if(isValidMove)
              isGAMEOVER = false;

            //setMargins(BOB_IMAGE, BOB_LEFT_MARGIN -= 0.0057, BOB_T0P_MARGIN,-6, -6);
        else {
            isGAMEOVER = true;
        }*/
    
}
-(void)MoveLeftDown_to_up:(CGFloat )leftmargin :(CGFloat)topmargin{
    CGRect screenRect = [[UIScreen mainScreen] bounds];

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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
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
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Map Runner" message:@"Game Over" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }// end of is Map Road 3_3
       /* if(isValidMove)
            setMargins(BOB_IMAGE, BOB_LEFT_MARGIN -= 0.0057, BOB_T0P_MARGIN,
                       -6, -6);
        else {
            isGAMEOVER = true;
            GAMEOVERDIALOG("GAME OVER");
        }*/
    
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
