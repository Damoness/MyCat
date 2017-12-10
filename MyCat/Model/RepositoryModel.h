//
//  RepositoryModel.h
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <Foundation/Foundation.h>
//"repo": {
//    "id": 11997640,
//    "name": "alibaba/otter",
//    "url": "https://api.github.com/repos/alibaba/otter"
//},
@interface RepositoryModel : NSObject
@property (nonatomic,copy) NSString *id,*name,*url;
@end
