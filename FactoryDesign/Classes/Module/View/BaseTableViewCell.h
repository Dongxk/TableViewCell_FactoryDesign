//
//  BaseTableViewCell.h
//  FactoryDesign
//
//  Created by Dongxk on 2018/5/4.
//  Copyright © 2018年 Dongxk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

@interface BaseTableViewCell : UITableViewCell
@property (nonatomic, strong) BaseModel *bModel;

//根据Model返回对应的Cell
+ (instancetype)configCellWithModel:(BaseModel *)bModel;
//返回cell的高度
+ (CGFloat)cellHeightWithModel:(BaseModel *)bModel;
@end
