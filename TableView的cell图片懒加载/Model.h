//
//  Model.h
//  TableView的cell图片懒加载
//
//  Created by Sunell on 2019/3/29.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *imgUrl;
@property(nonatomic,strong)UIImage *img;
@end

NS_ASSUME_NONNULL_END
