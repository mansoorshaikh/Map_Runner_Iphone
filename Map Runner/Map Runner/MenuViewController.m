//
//  MenuViewController.m
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import "MenuViewController.h"
#import "HomeViewController.h"
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

    playBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.42,screenRect.size.height*0.65,80,50)];
    [playBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:35]];
    [playBtn setTitle:@"Play" forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    playBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //[playBtn setBackgroundImage:[UIImage imageNamed:@"backBtn2.png"] forState:UIControlStateNormal];
    [playBtn setBackgroundColor:[UIColor clearColor]];
    
    
    [self.view addSubview:playBtn];
    
    shareBtn=[[UIButton alloc]initWithFrame:CGRectMake(screenRect.size.width*0.37,screenRect.size.height*0.75,100,50)];
    [shareBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:35]];
    [shareBtn setTitle:@"Share" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //[playBtn setBackgroundImage:[UIImage imageNamed:@"backBtn2.png"] forState:UIControlStateNormal];
    [shareBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:shareBtn];
    
     ywidthbob = screenRect.size.height*0.90;
     ywidthsim = screenRect.size.height*0.10;
    leftposition=YES;
    indexvalue=0;
    marginVO=[[MarginVO alloc]init];
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.02 target:self selector:@selector(DateFunction) userInfo:nil repeats: YES];
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
    //[self.view addSubview:bobImg];
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
//[self.view addSubview:simamImg];
        
        indexvalue=indexvalue+1;
    }
}
-(void)playAction{
    HomeViewController *home=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    [self.navigationController pushViewController:home animated:NO];
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
