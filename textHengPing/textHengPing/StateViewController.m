//
//  StateViewController.m
//  textHengPing
//
//  Created by bosma on 14-3-7.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import "StateViewController.h"

@interface StateViewController ()

@end

@implementation StateViewController

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
    self.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem * stateBackBtn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(stateBackBtnAction:)];
    self.navigationItem.leftBarButtonItem=stateBackBtn;

}

- (void)stateBackBtnAction:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
