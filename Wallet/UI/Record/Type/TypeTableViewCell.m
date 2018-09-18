//
//  TypeTableViewCell.m
//  Wallet
//
//  Created by 王成浩 on 2018/9/18.
//  Copyright © 2018年 evan. All rights reserved.
//

#import "TypeTableViewCell.h"

@interface TypeTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@end

@implementation TypeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(RecordTypeModel *)model {
    _model = model;
    self.typeImageView.image = [UIImage imageNamed:model.img_name];
    self.typeLabel.text = model.name;
}
@end
