//
//  LoginViewModel.h
//  RACCommandDemo
//
//  Created by drogan Zheng on 2018/6/9.
//  Copyright © 2018年 ReactiveObjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface LoginViewModel : NSObject

@property (nonatomic,copy) NSString *iconURL;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,strong) RACSignal *loginEnableSignal;
@property (nonatomic,strong) RACCommand *loginCommand;
@property (nonatomic,assign) BOOL isLogining;
@property (nonatomic,strong) RACSubject *statusSubject;

@end
