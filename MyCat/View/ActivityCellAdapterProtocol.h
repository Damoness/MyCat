//
//  ActivityCellAdapterProtocol.h
//  MyCat
//
//  Created by Damoness on 2017/12/11.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@protocol ActivityCellAdapterProtocol <NSObject>

-(NSURL*)imageURL;
-(NSString*)actorNameStr;
-(NSString*)repoStr;
-(NSString*)timeStr;

@end
