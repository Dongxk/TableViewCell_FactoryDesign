//
//  TableViewCell_Model_One.m
//  FactoryDesign
//
//  Created by Dongxk on 2018/5/4.
//  Copyright © 2018年 Dongxk. All rights reserved.
//

#import "TableViewCell_Model_One.h"
#import "Model_One.h"

@interface TableViewCell_Model_One()
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel      *lab;
@end
@implementation TableViewCell_Model_One

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    _imgView = [UIImageView new];
    [self.contentView addSubview:_imgView];
    
    _lab = [[UILabel alloc]init];
    _lab.numberOfLines = 2;
    [self.contentView addSubview:_lab];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.height.mas_equalTo(90);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 20);
    }];
    
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_imgView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(_imgView);
        make.height.mas_equalTo(50);
    }];
}


//重写父类返回cell高度方法
+ (CGFloat)cellHeightWithModel:(BaseModel *)model
{
    return 170;
}


- (void)setBModel:(BaseModel *)bModel
{
    Model_One *oneModel = (Model_One *)bModel;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:oneModel.imgsrc] placeholderImage:[UIImage imageNamed:@"common_pic_default"]];
    _lab.text = oneModel.title;
    
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
