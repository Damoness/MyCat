//
//  LoginViewController.m
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import "LoginViewController.h"
#import "WebLoginViewController.h"


static NSString *OAuth2_Login_Url = @"https://github.com/login/oauth/authorize/?client_id=2413918df2f9ff8e4103&state=1991&redirect_uri=https://github.com/damoness/MyCat&scope=user,public_repo" ;

@interface LoginViewController ()
@property (nonatomic,strong) UIButton *oAuth2LoginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setUpViews];
    
}


-(void)setUpViews{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.oAuth2LoginButton = ({
       
        UIButton *button =  [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitle:@"授权登录" forState:UIControlStateNormal];
        
        [self.view addSubview:button];
        
        button;
    });
    
    [self.oAuth2LoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-30);
    
    }];
    
    [self.oAuth2LoginButton bk_addEventHandler:^(id sender) {
        
        
        WebLoginViewController *webVC = [[WebLoginViewController alloc]initWithURL:[NSURL URLWithString:OAuth2_Login_Url]];
        
        webVC.logInBlock = ^(NSString *code) {
          
            
            NSLog(@"code:%@",code);
            
            
            AFHTTPSessionManager *manager=[AFHTTPSessionManager   manager];
            
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            
            //需要设置接受类型
            [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            
            NSDictionary *parameters = @{
                                         @"client_id":@"2413918df2f9ff8e4103",
                                    @"client_secret":@"b286edcd288e1a6a6a189949fa68c994285d4c19",
                                         @"code":code,
                                         @"redirect_uri":@"https://github.com/damoness/MyCat",
                                         @"state":@"1991"
                                         };
            
            
            [manager POST:@"https://github.com/login/oauth/access_token" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                
                NSLog(@"responseObject:%@",responseObject);
                
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
                
            }];
            
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                
                [self.navigationController popViewControllerAnimated:YES];
            });
            
        };
        
        [self.navigationController pushViewController:webVC animated:YES];
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
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
