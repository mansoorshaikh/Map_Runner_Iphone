//
//  AppDelegate.h
//  Map Runner
//
//  Created by arvind on 2/12/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property(nonatomic,readwrite) BOOL bottomPlayControlsVisible;
@property(nonatomic,readwrite) BOOL isBottomPlaying;
@property(nonatomic,readwrite) int playCounter;

@property(nonatomic,retain) NSString *firstPlayFromCollection;

@end

