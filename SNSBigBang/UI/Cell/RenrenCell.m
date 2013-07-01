//
//  RenrenCell.m
//  SNSBigBang
//
//  Created by 張 寧 on 2013/07/01.
//  Copyright (c) 2013年 張 寧. All rights reserved.
//

#import "RenrenCell.h"

@interface RenrenCell()

@property (nonatomic, strong) UIImage *avatarImage;
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation RenrenCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(3,3, 44, 44)];
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self addSubview:self.avatarView];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadDataFromCache:(RenrenNewsCell *)dataCell{
    NSLog(@"%@",dataCell);
    self.avatarImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dataCell.headURL]]];
    [self.avatarView setContentMode:UIViewContentModeScaleToFill];
    self.avatarView.image = self.avatarImage;
    UIFont *font = [UIFont fontWithName:@"Arial" size:12.0];
    CGSize size = CGSizeMake(320, 960);
    CGSize nameLabelSize = [dataCell.name sizeWithFont:font constrainedToSize:size];
    self.nameLabel.frame = CGRectMake(50, 3, nameLabelSize.width, nameLabelSize.height);
    self.nameLabel.font = font;
    self.nameLabel.text = dataCell.name;
    [self addSubview:self.nameLabel];
    
    NSLog(@"%@",dataCell.content);
    font = [UIFont fontWithName:@"Arial" size:15.0];
    size = CGSizeMake(320, 960);
    CGSize statusLabelSize = [dataCell.content sizeWithFont:font constrainedToSize:size];
    self.statusLabel.frame = CGRectMake(50, nameLabelSize.height + 5, statusLabelSize.width, statusLabelSize.height);
    self.statusLabel.font = font;
    self.statusLabel.text = dataCell.content;
    [self addSubview:self.statusLabel];
    
}

@end