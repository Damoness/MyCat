//
//  ActivityCell.m
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadData:(id<ActivityCellAdapterProtocol>)data{
    
    
    [self.myImageView sd_setImageWithURL:data.imageURL];
    self.actorName.text = data.actorNameStr;
    self.repoLabel.text = data.repoStr;
    self.timeLabel.text = data.timeStr;
    
    
}

@end
