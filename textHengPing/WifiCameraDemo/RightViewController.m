//
//  RightViewController.m
//  WifiCameraDemo
//  
//  Created by bosma on 14-3-14.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import "RightViewController.h"
#import "SetViewController.h"
#import "PhotoViewController.h"
#import "CameraViewController.h"
#import "StateViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    //picker数组数据
    pickerArray = [NSArray arrayWithObjects:
                   @"640*480 30fps",
                   @"800*600 30fps",
                   @"1280*720 30fps",
                   @"1280*960 30fps",
                   @"1920*1080 15fps",
                   @"2592*1944 10fps",nil];
    self.rightPicker.delegate = self;
    self.rightPicker.dataSource = self;
    self.rightTextFiel.delegate = self;
    self.rightTextFiel.text = @"默认值";
    
    //初级加载隐藏Picker和Toolbar
    firstLoad = YES;
    self.rightPicker.hidden = YES;
    self.rightDoneCanelTools.hidden = YES;
    
    
}

#pragma mark - UIPickerViewDataSource
//返回列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//返回行数
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
//返回内容
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        selectedRow = row;
        NSLog(@"选择的是行数是:%d",selectedRow);
        [self.rightPicker reloadAllComponents];
    }
}

#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 150, 30);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:18.0f]];
    }
    
    pickerLabel.text =  [pickerArray objectAtIndex:row];
    
    return pickerLabel;
    
}


#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.view endEditing:YES];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.rightPicker.hidden = NO;
                         self.rightDoneCanelTools.hidden = NO;
                         // self.textFieldEnterDate.text = @"";
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    
    self.rightPicker.hidden = NO;
    self.rightDoneCanelTools.hidden = NO;
    // self.textFieldEnterDate.text = @"";
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return  YES;
    
}


#pragma mark - 按钮方法

- (IBAction)doneAction:(id)sender {
    self.rightTextFiel.text = [NSString stringWithFormat:@"%@",[pickerArray objectAtIndex:[self.rightPicker selectedRowInComponent:0]]];
    NSLog(@"你选择的分辨率是:%@",self.rightTextFiel.text);
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.rightPicker.hidden = YES;
                         self.rightDoneCanelTools.hidden = YES;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

- (IBAction)canelAction:(id)sender {
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.rightPicker.hidden = YES;
                         self.rightDoneCanelTools.hidden = YES;
                         
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
}

- (IBAction)rightSetBtn:(id)sender {
    SetViewController * setView = [[SetViewController alloc]init];
    UINavigationController * setNav = [[UINavigationController alloc]initWithRootViewController:setView];
    [self presentViewController:setNav animated:YES completion:nil];
}


- (IBAction)rightPhotoBtn:(id)sender {
    PhotoViewController * photoView = [[PhotoViewController alloc]init];
    UINavigationController * photoNav = [[UINavigationController alloc]initWithRootViewController:photoView];
    [self presentViewController:photoNav animated:YES completion:nil];
}

- (IBAction)rightCameraBtn:(id)sender {
    CameraViewController * cameraView = [[CameraViewController alloc]init];
    UINavigationController * cameraNav = [[UINavigationController alloc]initWithRootViewController:cameraView];
    [self presentViewController:cameraNav animated:YES completion:nil];
}

- (IBAction)rightStateBtn:(id)sender {
    
    StateViewController * stateView = [[StateViewController alloc]init];
    UINavigationController * stateNav = [[UINavigationController alloc]initWithRootViewController:stateView];
    [self presentViewController:stateNav animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
