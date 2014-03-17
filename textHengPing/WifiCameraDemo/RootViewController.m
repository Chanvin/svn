//
//  RootViewController.m
//  WifiCameraDemo
//
//  Created by bosma on 14-3-14.
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

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - mainBtnAction

- (IBAction)mainBtnToSmaller:(id)sender {
    NSLog(@"点击第1个");

}

- (IBAction)mainBtnToBigger:(id)sender {
    NSLog(@"点击第2个");

}
- (IBAction)mainBtnToFocusing:(id)sender {
    NSLog(@"点击第3个");

}

- (IBAction)mainBtnToPhoto:(id)sender {
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
    NSLog(@"%@",path);
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(image)];
    [data writeToFile:path atomically:YES];
    
    NSLog(@"保存完毕");
}



- (IBAction)mainBtnToCamera:(id)sender {
    NSLog(@"点击第5个");

}
@end
