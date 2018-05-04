//
//  TableViewCell_Model_Two.m
//  FactoryDesign
//
//  Created by Dongxk on 2018/5/4.
//  Copyright © 2018年 Dongxk. All rights reserved.
//

#import "TableViewCell_Model_Two.h"
#import "Model_Two.h"

#define kWidth ([UIScreen mainScreen].bounds.size.width - 40)/3.0
@interface TableViewCell_Model_Two()
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation TableViewCell_Model_Two

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    for (int i = 0; i < 3; i++) {
        _imgView = [[UIImageView alloc]init];
        _imgView.tag = 1000 + i;
        [self.contentView addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10 + kWidth * i);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(kWidth);
        }];
    }
  
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
}


//重写父类返回cell高度方法
+ (CGFloat)cellHeightWithModel:(BaseModel *)model
{
    return 140;
}


- (void)setBModel:(BaseModel *)bModel{
    
    Model_Two *twoModel = (Model_Two *)bModel;
    UIImageView *oneImageView = (UIImageView*)[self.contentView viewWithTag:1000];
    UIImageView *twoImageView = (UIImageView*)[self.contentView viewWithTag:1001];
    UIImageView *threeImageView = (UIImageView*)[self.contentView viewWithTag:1002];
 
    [oneImageView sd_setImageWithURL:[NSURL URLWithString:twoModel.imgsrc1] placeholderImage:[UIImage imageNamed:@""]];
    [twoImageView sd_setImageWithURL:[NSURL URLWithString:twoModel.imgsrc2] placeholderImage:[UIImage imageNamed:@""]];
    [threeImageView sd_setImageWithURL:[NSURL URLWithString:twoModel.imgsrc3] placeholderImage:[UIImage imageNamed:@""]];
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
