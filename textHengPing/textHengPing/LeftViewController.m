//
//  LeftViewController.m
//  textHengPing
//
//  Created by bosma on 14-3-5.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()
@property(nonatomic,strong)NSArray * leftTitleArr;
@property(nonatomic,strong)UISlider * leftSlider;
@end

@implementation LeftViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self _initSliderAndScrollView];
}



- (void)_initSliderAndScrollView{
    //左侧标题
    self.leftTitleArr = [NSArray arrayWithObjects:
                         @"亮度:110",@"对比度:32",@"焦点:0",
                         @"全景:0",@"倾斜:0",@"饱和度:32",
                         @"清晰度:8",@"白平衡:4650",@"色调:0",
                         @"增益:64",@"伽玛:120",@"逆光对比:0",
                         @"电力线:50HZ",nil];
    //初始化ScrollView
    UIScrollView * leftScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, HEIGHT-120, WIDTH-248)];
    leftScrollView.contentSize = CGSizeMake(HEIGHT-120, 750);
    leftScrollView.delegate = self;
    for (int i=0; i<12; i++) {
        //初始化Slider
        self.leftSlider = [[UISlider alloc]initWithFrame:CGRectMake(15, 30+60*i, 165, 20)];
      //  self.leftSlider.value = 110.0;//默认值
      //  self.leftSlider.minimumValue = 0.0;//最小值
      //  self.leftSlider.maximumValue = 255.0;//最大值
        self.leftSlider.tag=111+i;
        //滑动滑块时事件
        [self.leftSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        //滑动结束时的事件
        [self.leftSlider addTarget:self action:@selector(sliderDragUp:) forControlEvents:UIControlEventTouchUpInside];
        [leftScrollView addSubview:self.leftSlider];
        
        //初始化Label
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5+60*i, 80, 20)];
        _leftLabel.tag = 121+i;
        _leftLabel.text = [self.leftTitleArr objectAtIndex:i];
        _leftLabel.font = [UIFont fontWithName:nil size:13];
        [leftScrollView addSubview:_leftLabel];
    }
    UIButton * leftFirstBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [leftFirstBtn setTitle:@"恢复默认设置" forState:UIControlStateNormal];
    leftFirstBtn.frame = CGRectMake(90, 710, 90, 30);
    [leftFirstBtn addTarget:self action:@selector(leftFirstBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftScrollView addSubview:leftFirstBtn];
    [self.view addSubview:leftScrollView];
    
}

- (void)leftFirstBtnAction:(id)sender{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"恢复出厂设置" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        NSLog(@"恢复出厂设置");
    }
}


#pragma mark - SliderMethod
//滑条方法
- (void)sliderValueChanged:(id)sender{
    UISlider * slider = (UISlider*)sender;
    switch (slider.tag) {
        case 111:
        {
            UILabel * label = (UILabel*)[self.view viewWithTag:121];
            NSLog(@"label.tag=%d正在滑动",label.tag);
            slider.value = 110;
            slider.minimumValue = 0;
            slider.maximumValue = 255;
            int progressAsInt = (int)roundf(slider.value);
            label.text = [NSString stringWithFormat:@"亮度:%d", progressAsInt];
            
        }
        default:
            break;
    }
}

- (void)sliderDragUp:(id)sender{
    NSLog(@"滑动结束");
    
}




#pragma mark - MemoryWarning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
