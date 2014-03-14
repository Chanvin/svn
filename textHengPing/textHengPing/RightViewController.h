//
//  RightViewController.h
//  textHengPing
//
//  Created by bosma on 14-3-10.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    NSArray *pickerArray;
    
    int selectedRow;
    
    BOOL firstLoad;
}

@property (weak, nonatomic) IBOutlet UIToolbar *rightDoneCanelTools;
@property (weak, nonatomic) IBOutlet UITextField *rightTextFiel;
@property (weak, nonatomic) IBOutlet UIPickerView *rightPicker;
@property (weak, nonatomic) IBOutlet UIButton *rightSetBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightStateBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightPhotoBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightCameraBtn;


- (IBAction)doneAction:(id)sender;
- (IBAction)canelAction:(id)sender;






@end
