//
//  BaseTableViewCell.m
//  FactoryDesign
//
//  Created by Dongxk on 2018/5/4.
//  Copyright © 2018年 Dongxk. All rights reserved.
//

#import "BaseTableViewCell.h"


@implementation BaseTableViewCell

+ (instancetype)configCellWithModel:(BaseModel *)bModel{
    
    /*
     *
        * 先获取model名称_
        * 根据model拼出cell的名称，也可以直接获取cell名称，这个在文件命名的时候尽量的规范、有规律点；
        *使用runtime创建cell
     */
    //获取model名称
    NSString *model_Name = [NSString stringWithUTF8String:object_getClassName(bModel)];
    //根据Model的名字拼接cell获取Cell类名
    NSString *cell_Name = [NSString stringWithFormat:@"TableViewCell_%@", model_Name];
    //使用runtime通过类名称获取对象并且创建
    BaseTableViewCell *cell = [[objc_getClass(cell_Name.UTF8String) alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model_Name];
    return cell;
    
}

+ (CGFloat)cellHeightWithModel:(BaseModel *)bModel{
    
    
    NSString *mode_Name = [NSString stringWithUTF8String:object_getClassName(bModel)];
    NSString *cell_Name = [NSString stringWithFormat:@"TableViewCell_%@", mode_Name];
    return [objc_getClass(cell_Name.UTF8String) cellHeightWithModel:bModel];
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
