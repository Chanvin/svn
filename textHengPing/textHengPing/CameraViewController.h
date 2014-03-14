//
//  CameraViewController.h
//  textHengPing
//
//  Created by bosma on 14-3-7.
//  Copyright (c) 2014年 cn.com.bosma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * cameraTableView;
@property(nonatomic,strong)UIBarButtonItem * cameraEditBtn;
@end
