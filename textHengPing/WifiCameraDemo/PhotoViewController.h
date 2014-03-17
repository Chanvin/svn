//
//  PhotoViewController.h
//  WifiCameraDemo
//
//  Created by bosma on 14-3-17.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *photoCollectView;

@end
