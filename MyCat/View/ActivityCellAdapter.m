//
//  ActivityCellAdapter.m
//  MyCat
//
//  Created by Damoness on 2017/12/11.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import "ActivityCellAdapter.h"
#import "ActivityModel.h"
@implementation ActivityCellAdapter{

    id _data;
}

-(instancetype)initWithData:(id)data{
    
    if (self = [super init]) {
        
        _data = data;
        
    }
    return self;
}


- (NSString *)actorNameStr {
    if ([_data isKindOfClass:[ActivityModel class]]) {
        
        ActivityModel *model = _data;
        
        return model.actor.display_login;
        
    }else{
        return nil;
    }
    
}

- (NSURL *)imageURL {
    if ([_data isKindOfClass:[ActivityModel class]]) {
        
        ActivityModel *model = _data;
        
        return [NSURL URLWithString:model.actor.avatar_url];
        
    }else{
        return nil;
    }
}

- (NSString *)repoStr {
    if ([_data isKindOfClass:[ActivityModel class]]) {
        
        ActivityModel *model = _data;
        
        return model.repo.name;
        
    }else{
        return nil;
    }
}

- (NSString *)timeStr{
    if ([_data isKindOfClass:[ActivityModel class]]) {
        
        ActivityModel *model = _data;
        
        return model.created_at;
        
    }else{
        return nil;
    }
}


@end

