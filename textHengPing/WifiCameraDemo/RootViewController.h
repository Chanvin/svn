//
//  RootViewController.h
//  WifiCameraDemo
//
//  Created by bosma on 14-3-14.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *mainSmallerBtn;
@property (strong, nonatomic) IBOutlet UIButton *mainBiggerBtn;
@property (strong, nonatomic) IBOutlet UIButton *mainFoucseBtn;
@property (strong, nonatomic) IBOutlet UIButton *mainPhotoBtn;
@property (strong, nonatomic) IBOutlet UIButton *mainCameraBtn;
@property (strong, nonatomic) UIImage *saveImage;



- (IBAction)mainBtnToSmaller:(id)sender;
- (IBAction)mainBtnToBigger:(id)sender;
- (IBAction)mainBtnToFocusing:(id)sender;
- (IBAction)mainBtnToPhoto:(id)sender;
- (IBAction)mainBtnToCamera:(id)sender;







@end
