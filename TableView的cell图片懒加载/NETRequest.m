//
//  NETRequest.m
//  TableView的cell图片懒加载
//
//  Created by Sunell on 2019/3/29.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import "NETRequest.h"
#import "Model.h"

@implementation NETRequest

-(void)loadImageUrlForCell:(Model *)model{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[[NSOperationQueue alloc] init] ];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:model.imgUrl] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            model.img = [UIImage imageWithData:data];
            if (self->_block) {
                self->_block();
            }
        }
    }];
    [task resume];
}

@end
