//
//  ActivityCellAdapter.h
//  MyCat
//
//  Created by Damoness on 2017/12/11.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActivityCellAdapterProtocol.h"
@interface ActivityCellAdapter : NSObject<ActivityCellAdapterProtocol>


-(instancetype)initWithData:(id)data;

@end
