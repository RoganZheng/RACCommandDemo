//
//  ViewController.h
//  RACCommandDemo
//
//  Created by drogan Zheng on 2018/6/9.
//  Copyright © 2018年 ReactiveObjc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UITextField *textUserName;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
@property (weak, nonatomic) IBOutlet UILabel *statusLable;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

