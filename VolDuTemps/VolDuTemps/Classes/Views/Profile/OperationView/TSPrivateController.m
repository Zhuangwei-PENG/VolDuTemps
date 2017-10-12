//
//  TSPrivateController.m
//  VolDuTemps
//
//  Created by Zhuangwei PENG on 2017/10/11.
//  Copyright © 2017年 Zhuangwei PENG. All rights reserved.
//

#import "TSPrivateController.h"
//#import "GestureViewController.h"
#import "TSSwitchItem.h"

#import <LocalAuthentication/LocalAuthentication.h>

@interface TSPrivateController () <TSSettingViewCellDelegate>
@property (nonatomic, strong) TSSwitchItem *passWord;
@property (nonatomic, strong) TSSwitchItem *touchID;
@property (nonatomic, strong) TSSwitchItem *graphID;

@property (nonatomic, strong) UIWebView *webview;
@end

@implementation TSPrivateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"隐私";
    [self setGroup];
    
    
}

- (void)setGroup{
    __weak typeof(self) weakself = self;
    
    self.passWord = [TSSwitchItem itemWithTitle:@"设置密码"];
    TSSettingGroup *groupOne = [TSSettingGroup groupWithItems:@[self.passWord]];
    [self.groups addObject:groupOne];
    
    self.touchID = [TSSwitchItem itemWithTitle:@"指纹解锁"];
    self.graphID = [TSSwitchItem itemWithTitle:@"图形解锁"];
    TSSettingGroup *groupTwo = [TSSettingGroup groupWithItems:@[self.touchID, self.graphID]];
    
    self.touchID.option = ^{
        if (weakself.touchID.isOn) {
            NSLog(@"指纹解锁");
            [weakself openTouchID];
            if (weakself.graphID.isOn) {
                weakself.graphID.isOn = NO;
                [weakself.tableView reloadData];
            }
        }else{
            NSLog(@"关闭指纹解锁");
        }
    };
  
    self.graphID.option = ^{
        if (weakself.graphID.isOn) {
            NSLog(@"图形解锁");
            //跳转图形解锁界面
            TSBasicSettingController *vc = [[TSBasicSettingController alloc] init];
            [weakself.navigationController pushViewController:vc animated:YES];
            //userDefault 记录锁已经打开的命令
//            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//            [userDefault setBool:weakself.graphID.isOn forKey:@"graphID"];
//            [userDefault synchronize];
            //userDefault 记录密码
//            GestureViewController *gestureVc = [[GestureViewController alloc] init];
//            gestureVc.type = GestureViewControllerTypeSetting;
//            weakself.graphID.destinationVC = [GestureViewController class];
//            [weakself.tableView reloadData];
            
            if (weakself.touchID.isOn) {
                weakself.touchID.isOn = NO;
                [weakself.tableView reloadData];
            }
        }else{
            NSLog(@"关闭图形解锁");
        }
    };
    
    self.passWord.option = ^{
        
        if (self.passWord.isOn && self.groups.count == 1) {
            [weakself.groups addObject:groupTwo];
            [weakself.tableView reloadData];
            
        }else if(!weakself.passWord.isOn){
            [weakself.groups removeLastObject];
            [weakself.tableView reloadData];
        }
    };
    
    
}


- (void)openTouchID{
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.0) {
        return;
    }

    [self createTouchID];
}

- (void)createTouchID{
    //创建LAContext
    LAContext* context = [[LAContext alloc] init];
    NSError* error = nil;
    NSString* result = @"请验证已有指纹";
    
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //支持指纹验证
        NSLog(@"成功啦");

        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:result
                          reply:^(BOOL success, NSError *error) {
//            if (success) {
//                //验证成功，主线程处理UI
//                NSLog(@"成功啦");
//                //用户选择输入密码，切换主线程处理
//
//                dispatch_async(dispatch_get_main_queue(), ^{
////                    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
//                    NSLog(@"刷新啦");
//                });
//            }
//            else
//            {
//                NSLog(@"%@",error.localizedDescription);
//                switch (error.code) {
//                    case LAErrorSystemCancel:
//                    {
//                        //系统取消授权，如其他APP切入
//                        break;
//                    }
//                    case LAErrorUserCancel:
//                    {
//                        //用户取消验证Touch ID
//                        break;
//                    }
//                    case LAErrorAuthenticationFailed:
//                    {
//                        //授权失败
//                        break;
//                    }
//                    case LAErrorPasscodeNotSet:
//                    {
//                        //系统未设置密码
//                        break;
//                    }
//                    case LAErrorTouchIDNotAvailable:
//                    {
//                        //设备Touch ID不可用，例如未打开
//                        break;
//                    }
//                    case LAErrorTouchIDNotEnrolled:
//                    {
//                        //设备Touch ID不可用，用户未录入
//                        break;
//                    }
//                    case LAErrorUserFallback:
//                    {
//                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                            //用户选择输入密码，切换主线程处理
//
//                        }];
//                        break;
//                    }
//                    default:
//                    {
//                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                            //其他情况，切换主线程处理
//                        }];
//                        break;
//                    }
//                }
//            }
        }];
    }
    else
    {
//        //不支持指纹识别，LOG出错误详情
        NSLog(@"不支持指纹识别");
//
//        switch (error.code) {
//            case LAErrorTouchIDNotEnrolled:
//            {
//                NSLog(@"TouchID is not enrolled");
//                break;
//            }
//            case LAErrorPasscodeNotSet:
//            {
//                NSLog(@"A passcode has not been set");
//                break;
//            }
//            default:
//            {
//                NSLog(@"TouchID not available");
//                break;
//            }
//        }
//
//        NSLog(@"%@",error.localizedDescription);
        return;
    }
}

#pragma mark - Delegate
//重写父类的代理方法，给cell添加代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TSSettingViewCell *cell = (TSSettingViewCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.delegate = self;

    return cell;
}

//实现cell的代理方法获取Switch的状态
- (void)switchValueChanged:(TSSwitchItem *)item atIndexPath:(NSIndexPath *)indexPath{
    TSSettingViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];

    TSSwitchItem *switchItem = (TSSwitchItem *)cell.item;
    switchItem.isOn = item.isOn;
    item.option();
}


@end
