//
//  AppDelegate.h
//  textHengPing
//
//  Created by bosma on 14-3-5.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "RightViewController.h"
#import "LeftViewController.h"
#import "PKRevealController.h"

@class PKRevealController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readwrite) PKRevealController *revealController;

@end
