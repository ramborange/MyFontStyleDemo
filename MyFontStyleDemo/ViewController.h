//
//  ViewController.h
//  MyFontStyleDemo
//
//  Created by ljf on 16/5/31.
//  Copyright © 2016年 hanwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@end

