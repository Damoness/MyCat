//
//  ActivityModel.h
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActorModel.h"
#import "RepositoryModel.h"

@interface ActivityModel : NSObject

@property (nonatomic,copy) NSString *id,*type,*created_at;

@property (nonatomic,strong) ActorModel *actor;

@property (nonatomic,strong) RepositoryModel *repo;

@end
