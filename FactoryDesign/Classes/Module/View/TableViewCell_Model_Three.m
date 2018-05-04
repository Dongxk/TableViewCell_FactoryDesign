//
//  TableViewCell_Model_Three.m
//  FactoryDesign
//
//  Created by Dongxk on 2018/5/4.
//  Copyright © 2018年 Dongxk. All rights reserved.
//

#import "TableViewCell_Model_Three.h"
#import "Model_Three.h"

#define kWidth ([UIScreen mainScreen].bounds.size.width)

@interface TableViewCell_Model_Three()
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel     *titleLab;
@property (nonatomic, strong) UILabel     *contentLab;
@end

@implementation TableViewCell_Model_Three

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
    
    _titleLab = [[UILabel alloc]init];
    [self.contentView addSubview:_titleLab];
    
    _contentLab = [UILabel new];
    [self.contentView addSubview:_contentLab];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.height.mas_equalTo(80);
    }];

    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(110);
        make.top.mas_equalTo(_imgView);
        make.width.mas_equalTo(kWidth - 120);
        make.height.mas_equalTo(30);
    }];
    
    [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLab);
        make.top.mas_equalTo(_titleLab.mas_bottom).mas_offset(10);
        make.width.height.mas_equalTo(_titleLab);
    }];
}

//重写父类返回cell高度方法
+ (CGFloat)cellHeightWithModel:(BaseModel *)bModel{

    return 100;
}

- (void)setBModel:(BaseModel *)bModel{
    
    Model_Three *threeModel = (Model_Three *)bModel;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:threeModel.picUrl] placeholderImage:[UIImage imageNamed:@""]];
    _titleLab.text = threeModel.singer;
    _contentLab.text = threeModel.name;
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
