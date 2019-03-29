//
//  MYCell.h
//  TableView的cell图片懒加载
//
//  Created by Sunell on 2019/3/29.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MYCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgUrl;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

NS_ASSUME_NONNULL_END
