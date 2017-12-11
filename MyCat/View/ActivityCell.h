//
//  ActivityCell.h
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityCellAdapterProtocol.h"

static NSString *Activity_Cell_Identifier = @"Activity_Cell_Identifier";


@interface ActivityCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *actorName;
@property (weak, nonatomic) IBOutlet UILabel *repoLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


-(void)loadData:(id<ActivityCellAdapterProtocol>)data;


@end
