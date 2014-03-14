//
//  PhotoViewController.h
//  textHengPing
//
//  Created by bosma on 14-3-12.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectView;

@end
