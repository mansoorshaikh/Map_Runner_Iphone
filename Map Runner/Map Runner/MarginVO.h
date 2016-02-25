//
//  MarginVO.h
//  Map Runner
//
//  Created by arvind on 2/13/16.
//  Copyright © 2016 arvind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MarginVO : NSObject
@property(nonatomic,retain) NSString *simLeftRight,*simTopDown;
@property(nonatomic,readwrite) BOOL isMovingUp,isMovingRight;
@end
