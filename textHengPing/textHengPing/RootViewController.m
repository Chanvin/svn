//
//  RootViewController.m
//  textHengPing
//
//  Created by bosma on 14-3-5.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    [self _initButton];

}

//初始化按钮
- (void)_initButton{
    NSArray * btnNameArr = [NSArray arrayWithObjects:@"缩小",@"放大",@"对焦",@"照xxx相",@"摄像", nil];
    for (int i=0; i<5; i++) {
        UIButton * mainBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        mainBtn.frame = CGRectMake(50+90*i, 250, 80, 30);
        [mainBtn setTitle:[btnNameArr objectAtIndex:i] forState:UIControlStateNormal];
        mainBtn.tag=105+i;
        [mainBtn addTarget:self action:@selector(mainBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:mainBtn];
    }
}


#pragma mark - mainBtnAction
- (void)mainBtnAction:(id)sender{
    UIButton * btn = (UIButton*)sender;
    switch (btn.tag) {
        case 105:
            [self mainBtnToSmaller];
            break;
        case 106:
            [self mainBtnToBigger];
            break;
        case 107:
            [self mainBtnToFocusing];
            break;
        case 108:
            [self mainBtnToPhoto];
            break;
        case 109:
            [self mainBtnToCamera];
            break;
            
        default:
            break;
    }
}


#pragma mark 缩小
- (void)mainBtnToSmaller{
    NSLog(@"点击第一个");
}
#pragma mark 放大
- (void)mainBtnToBigger{
    NSLog(@"点击第二个");
}

#pragma mark 对焦
- (void)mainBtnToFocusing{
    NSLog(@"点击第三个");
    
}




#pragma mark 照相
- (void)mainBtnToPhoto{
    UIAlertView  *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"截取成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil ];
    
    [alert show];
    
    NSLog(@"开始");
    [self savePhoto];
    [self saveToDisk:_saveImage];
}

//保存图片
- (void)savePhoto{
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions) {
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    }
    else
    {
        UIGraphicsBeginImageContext(imageSize);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow * window in [[UIApplication sharedApplication] windows]) {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            CGContextConcatCTM(context, [window transform]);
            CGContextTranslateCTM(context, -[window bounds].size.width*[[window layer] anchorPoint].x, -[window bounds].size.height*[[window layer] anchorPoint].y);
            [[window layer] renderInContext:context];
            
            CGContextRestoreGState(context);
        }
    }
    
    _saveImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSThread *thread=[[NSThread alloc] initWithTarget:self selector:@selector(saveThread:) object:_saveImage];
    [thread start];
    
    NSLog(@"截屏成功!");
}

-(void)saveThread:(UIImage*)image
{
    UIImageWriteToSavedPhotosAlbum(_saveImage, self, nil, nil);
}

//保存到本地Document中
- (void)saveToDisk:(UIImage *)image{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSLog(@"保存路径：%@",dir);
    
    NSString *path = [NSString stringWithFormat:@"%@/pic_%f.png",dir,[NSDate timeIntervalSinceReferenceDate]];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [data writeToFile:path atomically:YES];
    
    NSLog(@"保存完毕");
}


#pragma mark 摄像
- (void)mainBtnToCamera{
    NSLog(@"点击第五个");
}





   - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
