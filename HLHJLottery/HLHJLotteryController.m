//
//  HLHJLotteryController.m
//  YouYiMeiDemo
//
//  Created by book on 2018/11/14.
//  Copyright © 2018年 book. All rights reserved.
//

#import "HLHJLotteryController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import <TMSDK/TMHttpUserInstance.h>
#import <TMSDK/TMHttpUser.h>
#import <TMSDK/TMEngineConfig.h>
#import <SetI001/SetI001LoginViewController.h>
#import "HLHLotteryObject.h"
@interface HLHJLotteryController ()<UIWebViewDelegate,HLHLotteryDelegate>

@property (nonatomic, strong) UIWebView *LotteryWebView;

@end

@implementation HLHJLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.native = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.LotteryWebView];
    NSString * member_code = [[TMHttpUserInstance sharedManager] member_code];
    NSString *token = [TMHttpUser token];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/application/hlhj_transferlottery/wap?token=%@&member_code=%@",[TMEngineConfig sharedManager].domain,token,member_code]]];
    [self.LotteryWebView loadRequest:request];
    [self customBackButton];
}

// 自定义返回按钮
- (void)customBackButton{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 40, 40);
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = item;
}
// 返回按钮按下
- (void)backBtnClicked:(UIButton *)sender{
    //判断是否能返回到H5上级页面
    if (self.LotteryWebView.canGoBack==YES) {
        //返回上级页面
        [self.LotteryWebView goBack];

    }else{
        //退出控制器
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{

      JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
      HLHLotteryObject *lotteryObject = [HLHLotteryObject new];
    lotteryObject.delegate = self;
      context[@"tmAndroidInf"] = lotteryObject;

}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"开始加载了");
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载出错了");
}
- (void)goLoginAction {

    dispatch_async(dispatch_get_main_queue(), ^{
         [self.LotteryWebView reload];
    });
    SetI001LoginViewController *login = [[SetI001LoginViewController alloc]init];
    login.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:login animated:YES];
    
}

- (UIWebView *)LotteryWebView {

    if (!_LotteryWebView) {
        _LotteryWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _LotteryWebView.delegate = self;
    }
    return _LotteryWebView;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
