//
//  WebViewController.m
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import "WebLoginViewController.h"
@import WebKit;
@interface WebLoginViewController ()<WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webView;

@end

@implementation WebLoginViewController{
    
    NSURL *_url;
    
}

- (instancetype)initWithURL:(NSURL *)url{
    
    if (self = [super init]) {
        _url = url;
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.webView = [[WKWebView alloc]init];

    [self.view addSubview:self.webView];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.edges.equalTo(self.view);
        
    }];
    
    
    self.webView.navigationDelegate = self;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:_url]];
    
}



#pragma mark -- WKNavigationDelegate
//https://github.com/damoness/MyCat?code=009bf64fa7deb1209595&state=1991
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    NSMutableString *urlString = [webView.URL.absoluteString mutableCopy];

    NSString *prefixStr = @"https://github.com/damoness/MyCat?";
    
    if ([urlString hasPrefix:prefixStr]) {
        
        
    NSString *code = [[[[[[urlString componentsSeparatedByString:@"?"]lastObject]componentsSeparatedByString:@"&"]firstObject]componentsSeparatedByString:@"="]lastObject];
        
        
        self.logInBlock(code);
        
    
    }
    
    
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
