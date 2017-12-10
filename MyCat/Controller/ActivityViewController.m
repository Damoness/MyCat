//
//  ActivityViewController.m
//  MyCat
//
//  Created by Damoness on 2017/12/10.
//  Copyright © 2017年 damoness. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityCell.h"
#import "ActivityModel.h"


static NSInteger NUM_OF_PAGE =  30;
static NSString *Activity_Url = @"https://api.github.com/users/damoness/received_events/public?page=%d&per_page=%d&token=5de98f97287c3a24f726c4a3d9b4a380e746baef";

typedef void (^completionblock)(id responseObject, NSError *error) ;


@interface ActivityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray<ActivityModel *> *dataArray;

@end

@implementation ActivityViewController{
    
    
    NSInteger _currentPage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpViews];
    
    [self fetchActivityData:nil];
    
}



//刷新
- (void)fetchActivityData:(completionblock)block{
    
    NSDate *startDate = [NSDate date];
    
    _currentPage = 1;
    
    NSString *urlString = [NSString stringWithFormat:Activity_Url,_currentPage,NUM_OF_PAGE];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSTimeInterval time = [[NSDate date]timeIntervalSinceDate:startDate];
        
        NSLog(@"time:%@",@(time));
        
        if (responseObject) {
            
            self.dataArray = [ActivityModel mj_objectArrayWithKeyValuesArray:responseObject];
            
            [self.tableView reloadData];
        }
        
        if (block) {
             block(responseObject,nil);
        }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        if (block) {
            block(nil,error);
        }
        
        
    }];
    
}

//获取更多数据
-(void)fectchMoreData:(completionblock)block{
    
    NSDate *startDate = [NSDate date];
    
    _currentPage++;
    
    NSString *urlString = [NSString stringWithFormat:Activity_Url,_currentPage,NUM_OF_PAGE];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSTimeInterval time = [[NSDate date]timeIntervalSinceDate:startDate];
        
        NSLog(@"time:%@",@(time));
        
        if (responseObject) {
            
            NSMutableArray *data =  [ActivityModel mj_objectArrayWithKeyValuesArray:responseObject];
    
            //
            NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
            for (int i = 0; i < data.count ;i++) {
                
                [indexPaths addObject:[NSIndexPath indexPathForRow:i + self.dataArray.count inSection:0]];
                
            }
            
            [self.dataArray addObjectsFromArray:data];
            
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
            
        
        }
        
        block(responseObject,nil);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block(nil,error);
        
    }];
    
}

- (void)setUpViews{
    
    self.title = @"我的活动";
    
    self.dataArray = [NSMutableArray array];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.tableView = ({
        UITableView *aTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    
        self.view.backgroundColor  = [UIColor whiteColor];
        
        
        [aTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ActivityCell class]) bundle:nil] forCellReuseIdentifier:Activity_Cell_Identifier];
        aTableView.delegate = self;
        aTableView.dataSource = self;
        [self.view addSubview:aTableView];
        aTableView;
    });
    
    
    
    __weak typeof(self) weakSelf = self;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        [weakSelf fetchActivityData:^(id responseObject, NSError *error) {
            
            
            
            [weakSelf.tableView.mj_header endRefreshing];

        }];
        
        
        
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf fectchMoreData:^(id responseObject, NSError *error) {
            
            
            
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
        
        
    }];
    
    
}



#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:Activity_Cell_Identifier];
    
    ActivityModel *model = self.dataArray[indexPath.row];
    
    cell.actorName.text = model.actor.display_login;
    
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:model.actor.avatar_url] completed:nil];
    
    cell.repoLabel.text = model.repo.name;
    cell.timeLabel.text = model.created_at;

    return cell;
    
    
}


#pragma mark -- UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
