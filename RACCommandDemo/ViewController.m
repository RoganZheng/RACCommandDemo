//
//  ViewController.m
//  RACCommandDemo
//
//  Created by drogan Zheng on 2018/6/9.
//  Copyright © 2018年 ReactiveObjc. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC.h>
#import "LoginViewModel.h"

@interface ViewController ()

@property (nonatomic ,strong) LoginViewModel *loginViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //绑定试图与viewModel
    [self bindViewModel];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)bindViewModel
{
    @weakify(self);
    RAC(self.loginViewModel,userName) = self.textUserName.rac_textSignal;
    RAC(self.loginViewModel,password) = self.textPassword.rac_textSignal;
    //将登录按钮能否点击与viewModel中的loginEnableSignal信号进行绑定
    RAC(self.loginButton,enabled) = self.loginViewModel.loginEnableSignal;
    
    RAC(self.statusLable,text) = self.loginViewModel.statusSubject;
    
    //头像信号的订阅
    [RACObserve(self.loginViewModel, iconURL) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        //根据返回的订阅信号自定义头像image
        self.iconImage.image = [UIImage imageNamed:x];
    }];
    
    //登录按钮能否点击颜色变化
    [self.loginViewModel.loginEnableSignal subscribeNext:^(NSNumber *x) {
        @strongify(self);
        UIColor *backgroundColor = x.integerValue == 0 ? [UIColor lightGrayColor] : [UIColor purpleColor];
        [self.loginButton setBackgroundColor:backgroundColor];
    }];
    
    //登录请求
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.loginViewModel.loginCommand execute:@"登录事件触发"];
    }];
    
}

- (LoginViewModel *)loginViewModel
{
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc]init];
    }
    return _loginViewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
