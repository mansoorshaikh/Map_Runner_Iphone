//
//  MenuViewController.h
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarginVO.h"
@class GADBannerView;

@interface MenuViewController : UIViewController
@property(nonatomic,retain) IBOutlet UIImageView *mainimageView,*bobImg,*simamImg;
@property(nonatomic,retain) IBOutlet UIButton *playBtn,*shareBtn;
@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,readwrite)CGFloat ywidthbob,ywidthsim,simTop,simLeft;
@property(nonatomic,readwrite) BOOL leftposition,rightposition,topposition,bottomposition;
@property(nonatomic,retain) NSMutableArray *simonArray;
@property(nonatomic,retain) MarginVO *marginVO;
@property(nonatomic,readwrite) int indexvalue;
@property(nonatomic, weak) IBOutlet GADBannerView *bannerView;

@end
