//
//  PhotoViewController.m
//  textHengPing
//
//  Created by bosma on 14-3-12.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCell.h"
#define KCellID @"PhotoCell"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * photoBackBtn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(photoBackBtnAction:)];
    UIBarButtonItem * photoEditBtn = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(photoEditBtnAction:)];
    self.navigationItem.leftBarButtonItem = photoBackBtn;
    self.navigationItem.rightBarButtonItem = photoEditBtn;
    
    //注册cell
    [self.photoCollectView registerClass:[PhotoCell class] forCellWithReuseIdentifier:KCellID];
    
}




#pragma mark 返回按钮方法
- (void)photoBackBtnAction:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 编辑按钮方法
- (void)photoEditBtnAction:(UIButton*)sender{
    NSLog(@"照相-->编辑按钮");
}

#pragma mark UICollectionView DataSourceDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 80;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = (PhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:KCellID forIndexPath:indexPath];
    
    // 设置imageView的图片
    cell.photoImageView.image = [UIImage imageNamed:@"book.jpg"];

    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
