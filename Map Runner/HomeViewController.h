//
//  HomeViewController.h
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarginVO.h"

@interface HomeViewController : UIViewController

@property(nonatomic,retain) UIView *roadView;
@property(nonatomic,retain) IBOutlet UIScrollView *mainscrollview;
@property(nonatomic,retain) IBOutlet UIImageView *leftgreenImg,*topgreenImg,*rightwaterImg,*downwaterImg,*insideFirstImg,*insideFirstImg1,*insideFirstImg2,*insideFirstImg3,*insideFirstImg4;
@property(nonatomic,retain) IBOutlet UIImageView *bobImg,*simamImg;
@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) NSMutableArray *simonArray;
@property(nonatomic,retain) MarginVO *marginVO;
@property(nonatomic,readwrite)CGFloat ywidthbobTop,ywidthsimLeft,BOB_LEFT_MARGIN,BOB_T0P_MARGIN,startPosition,SIMAN_LEFT_MARGIN,SIMAN_T0P_MARGIN,ywidth,
yheights;
@property(nonatomic,readwrite) BOOL isMovingUp,isMovingDown,isMovingLeft,isMovingRight,isValidMove,isGAMEOVER;
@property(nonatomic,readwrite) int indexvalue;
@property(nonatomic,retain) NSString *position;
@property(nonatomic,readwrite) double hor_1_top , hor_2_top , hor_3_top ,
hor_4_top , hor_5_top , hor_6_top ,
hor_7_top , hor_8_top ;
@property(nonatomic,readwrite) double ver_1_left , ver_2_left , ver_3_left ,
ver_4_left , ver_5_left, ver_6_left ;
@property(nonatomic,readwrite) BOOL isMaproad1_1,isMaproad1_2,isMaproad1_3,isMaproad1_4,isMaproad2_1,isMaproad2_2,isMaproad2_3,isMaproad2_4,isMaproad3_1,isMaproad3_2,isMaproad3_3,isMaproad3_4,isMaproad4_1,isMaproad4_2,isMaproad4_3,isMaproad4_4;
@property(nonatomic,readwrite) BOOL  isPause,isSimanMove,isWait,isBottom_to_Top,isTop_to_Bottom,isLeft_to_Right,isRight_to_Left;
@end
