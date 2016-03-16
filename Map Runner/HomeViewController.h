//
//  HomeViewController.h
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarginVO.h"
#import "CustomIOS7AlertView.h"
#import "CameraAlertView.h"
@import GoogleMobileAds;

@class GADBannerView;

@interface HomeViewController : UIViewController<UIAlertViewDelegate,GADInterstitialDelegate>

@property(nonatomic,retain) UIView *roadView;
@property(nonatomic,retain) IBOutlet UIScrollView *mainscrollview;
@property(nonatomic,retain) IBOutlet UIImageView *leftgreenImg,*topgreenImg,*rightwaterImg,*downwaterImg,*insideFirstImg,*insideFirstImg1,*insideFirstImg2,*insideFirstImg3,*insideFirstImg4;
@property(nonatomic,retain) IBOutlet UIImageView *bobImg,*simamImg;
@property(nonatomic,retain) NSTimer *timer,*timer2;
@property(nonatomic,retain) NSMutableArray *simonArray,*redimageArray;
@property(nonatomic,retain) MarginVO *marginVO;
@property(nonatomic,readwrite)CGFloat ywidthbobTop,ywidthsimLeft,BOB_LEFT_MARGIN,BOB_T0P_MARGIN,startPosition,SIMAN_LEFT_MARGIN,SIMAN_T0P_MARGIN,ywidth,
yheights;
@property(nonatomic,readwrite) BOOL isMovingUp,isMovingDown,isMovingLeft,isMovingRight,isValidMove,isGAMEOVER;
@property(nonatomic,readwrite) int indexvalue,indexvlaueRedimg,indexvalueRedimgCompa,imageIndex;
@property(nonatomic,retain) NSString *position;
@property(nonatomic,readwrite) double hor_1_top , hor_2_top , hor_3_top ,hor_4_top , hor_5_top , hor_6_top ,hor_7_top , hor_8_top ;
@property(nonatomic,readwrite) double ver_1_left , ver_2_left , ver_3_left ,ver_4_left , ver_5_left, ver_6_left ;
@property(nonatomic,readwrite) BOOL isMaproad1_1,isMaproad1_2,isMaproad1_3,isMaproad1_4,isMaproad2_1,isMaproad2_2,isMaproad2_3,isMaproad2_4,isMaproad3_1,isMaproad3_2,isMaproad3_3,isMaproad3_4,isMaproad4_1,isMaproad4_2,isMaproad4_3,isMaproad4_4;
@property(nonatomic,readwrite) BOOL  isPause,isSimanMove,isWait,isBottom_to_Top,isTop_to_Bottom,isLeft_to_Right,isRight_to_Left;
@property(nonatomic,retain)  UIAlertView *alert;
@property(nonatomic,retain) CameraAlertView *cav;
@property(nonatomic,retain) CustomIOS7AlertView *alertView;
@property(nonatomic,retain) IBOutlet UIImageView *bgImage;
@property(nonatomic,readwrite)CGFloat ywidthbob,ywidthsim,yheightsim,simTop,simLeft,bobleftmargin,bobtopmargin,bobrightmargin,bobdownmarign;
@property(nonatomic,retain) UILabel *scoreLbl,*scoreDisplyayLbl,*highScoreLbl,*highScoreDisplayLbl,*titleName,*maryNameLbl,*hydeparkNameLbl,*hydeparkNameLbl1,*mayfairNameLbl,*greenparkNameLbl,*southNameLbl,*maryroadNameLbl,*paddingNameLbl,*edgwareNameLbl,*bakerNameLbl,*gioucesterNameLbl,*marleboneyNameLbl,*bondstreetNameLbl,*grosvenorstreetNameLbl,*newbondNameLbl,*berkeleyNameLbl,*stratonstreetNameLbl,*berkeleystreetNameLbl,*piccadillyNameLbl,*knighsNameLbl,*queenNameLbl,*bromptNameLbl,*slonneNameLbl,*thurloeNameLbl,*gloucesterNameLbl,*gloucester1NameLbl,*kingsNameLbl,*chelseaNameLbl,*eustonNameLbl,*gowerNameLbl,*bloomsburyNameLbl,*goodgeNameLbl,*russelNameLbl,*tottennamNameLbl,*bloomsburyStreetNameLbl,*oxfordNameLbl,*sohoNameLbl,*regentNameLbl,*shaffesburyNameLbl,*piccadilly1NameLbl,*belgraviaNameLbl,*cadoganNameLbl,*eatonNameLbl,*grosvenerNameLbl,*ecclestenNameLbl,*buckinghamNameLbl,*belgraveNameLbl,*gowersNameLbl,*juddNameLbl,*graysNameLbl,*theobaldsNameLbl,*southampNameLbl,*highholbornNameLbl,*holbornNameLbl,*longNameLbl,*kingswayNameLbl,*stNameLbl,*coventNameLbl,*aldwychNameLbl,*whiteNameLbl,*victoryaNameLbl,*parliamentNameLbl,*victoriaNameLbl,*westNameLbl,*buckkingNameLbl,*marshamNameLbl,*millbankNameLbl,*greatNameLbl,*horebwrryNameLbl,*rochNameLbl,*vauxhallNameLbl;
@property(nonatomic,retain) NSMutableDictionary *repeatpointsDict;
@property(nonatomic,retain)UIImageView* redcolor;
@property(nonatomic,readwrite)long score,CURRENT_SCORE,Updatescoretime,Score_startTime,Score_timeInMilliseconds,Score_timeSwapBuff,Score_updatedTime,STARTSEC , CURRENTSEC,redline,updatemint,timeSwapBuff,scoreValuess,newscore;
@property (strong, nonatomic) UINavigationController *navController;
@property(nonatomic,retain) UIButton *signalBtn1,*signalBtn2,*signalBtn3,*signalBtn4,*signalBtn5,*signalBtn6,*signalBtn7,*signalBtn8,*signalBtn9,*signalBtn10,*signalBtn11,*signalBtn12,*signalBtn13,*signalBtn14,*signalBtn15,*signalBtn16,*signalBtn17,*signalBtn18,*signalBtn19,*signalBtn20,*signalBtn21,*signalBtn22,*signalBtn23,*signalBtn24,*signalBtn25,*signalBtn26,*signalBtn27,*signalBtn28,*pauseBtn;

@property(nonatomic,assign)int vibrateCount,admobCount,bobSpeed;
@property (nonatomic, retain)NSTimer * vibrateTimer;
@property(nonatomic, weak) IBOutlet GADBannerView *bannerView;

@end
