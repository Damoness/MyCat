//
//  ActorModel.h
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <Foundation/Foundation.h>


//"id": 5022872,
//"login": "lzwjava",
//"display_login": "lzwjava",
//"gravatar_id": "",
//"url": "https://api.github.com/users/lzwjava",
//"avatar_url": "https://avatars.githubusercontent.com/u/5022872?"

@interface ActorModel : NSObject
@property (nonatomic,copy) NSString *id,*login, *display_login,*url,*avatar_url;
@end
