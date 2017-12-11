//
//  WebViewController.h
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebLoginViewController : UIViewController



- (instancetype)initWithURL:(NSURL *)url;


@property (nonatomic,copy) void (^logInBlock)(NSString *code);


@end
