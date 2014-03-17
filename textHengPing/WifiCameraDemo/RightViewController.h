//
//  RightViewController.h
//  WifiCameraDemo
//
//  Created by bosma on 14-3-14.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    NSArray *pickerArray;
    
    int selectedRow;
    
    BOOL firstLoad;
}

@property (strong, nonatomic) IBOutlet UIToolbar *rightDoneCanelTools;
@property (strong, nonatomic) IBOutlet UITextField *rightTextFiel;
@property (strong, nonatomic) IBOutlet UIPickerView *rightPicker;
@property (strong, nonatomic) IBOutlet UIButton *rightSetBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightStateBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightPhotoBtn;
@property (strong, nonatomic) IBOutlet UIButton *rightCameraBtn;


- (IBAction)doneAction:(id)sender;
- (IBAction)canelAction:(id)sender;

@end
