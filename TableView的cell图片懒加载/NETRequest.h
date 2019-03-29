//
//  NETRequest.h
//  TableView的cell图片懒加载
//
//  Created by Sunell on 2019/3/29.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Model;
NS_ASSUME_NONNULL_BEGIN
typedef void(^completeBlock)(void);
@interface NETRequest : NSObject

@property(nonatomic,strong)completeBlock block;
-(void)loadImageUrlForCell:(Model *)imgUrl;

@end

NS_ASSUME_NONNULL_END
