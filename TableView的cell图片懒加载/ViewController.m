//
//  ViewController.m
//  TableView的cell图片懒加载
//
//  Created by Sunell on 2019/3/29.
//  Copyright © 2019 Sunell. All rights reserved.
//

#import "ViewController.h"
#import "MYCell.h"
#import "Model.h"
#import "NETRequest.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_arrData;
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"MYCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    [self.view addSubview:_tableView];
    
    NSDictionary *dic = @{@"name":@"网阿娇的顾客 爱的时刻了解大概阿萨德和高科技啊收到货狮吼功为安徽大使馆ID沙盒gas过A类跨境电商个阿斯兰的价格",@"imgUrl":@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3898956822,415361353&fm=26&gp=0.jpg"};
    Model *model = [[Model alloc] init];
    model.name = dic[@"name"];
    model.imgUrl = dic[@"imgUrl"];
    _arrData = [NSMutableArray new];
    for (int i = 0; i < 250; i ++) {
        [_arrData addObject:model];
    }
    
}

-(void)dealloc{
    NSLog(@"dealloc");
}

-(void)loadImageData{
    NSArray *items = [_tableView indexPathsForVisibleRows];
    for (int i = 0; i < items.count; i ++) {
        NSIndexPath *index = items[i];
        MYCell *cell = [_tableView cellForRowAtIndexPath:index];
        Model *model = _arrData[index.row];
        if (!model.img) {
            NETRequest *req = [[NETRequest alloc] init];
            req.block = ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (model.img) {
                        cell.imgUrl.image = model.img;
                    }
                });
            };
            [req loadImageUrlForCell:model];
        }
    }
}

//滑动停止时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
    [self loadImageData];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrData.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MYCell *cell = (MYCell *)[tableView dequeueReusableCellWithIdentifier: @"CELL"];
    
    Model *m = _arrData[indexPath.row];
    m.img = nil;
    cell.name.text = m.name;
    if (m.img) {
        cell.imgUrl.image = m.img;
    }else{
        //下载图片
        cell.imgUrl.image = [UIImage imageNamed:@"bg_nophoto"];
        
        if (!_tableView.decelerating) {  //拖拽停止时
            NSLog(@"!_tableView.decelerating");
            NETRequest *req = [[NETRequest alloc] init];
            req.block = ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (m.img) {
                        cell.imgUrl.image = m.img;
                    }

                });
            };
            [req loadImageUrlForCell:m];
        }
    }
    return cell;
}

@end
