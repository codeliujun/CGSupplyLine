//
//  LIUChooseArea.m
//  YouYouShoppingCenter
//
//  Created by 刘俊 on 15/9/3.
//  Copyright (c) 2015年 刘俊. All rights reserved.
//

#import "LIUChooseArea.h"


@interface LIUChooseArea ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *areaList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LIUChooseArea

- (NSString *)provinceid {
    if (!_provinceid) {
        _provinceid = @"";
    }
    return _provinceid;
}

- (NSString *)cityid {
    if (!_cityid) {
        _cityid = @"";
    }
    return _cityid;
}

- (NSArray *)areaList {
    if (!_areaList) {
        _areaList = @[];
    }
    return _areaList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.areaTitle;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self creatTableHeaderView];
    [self getData];
    // Do any additional setup after loading the view from its nib.
}

- (void)creatTableHeaderView {
    
    //首先创建一个父类的view
    UIView *headerSupperView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, 44)];
    CGChoShopHeaderView *headerView = [CGChoShopHeaderView view];
    headerView.frame = headerSupperView.bounds;
    [headerSupperView addSubview:headerView];
    NSInteger index = 0;
    switch (self.currentArreaType) {
        case AreaTypeProvince:
            index = 0;
            break;
        case AreaTypeCityid:
            index = 1;
            break;
        case AreaTypeArea:
            index = 2;
            break;
        case AreaTypeShop:
            index = 3;
            break;
    }
    
    [headerView proImageHilighted:index];
    
    self.tableView.tableHeaderView = headerSupperView;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)getData {
    WS(ws);
    
    if (self.currentArreaType == AreaTypeShop) {
    /*api/Shop/search?keywords={keywords}&provinceid={provinceid}&cityid={cityid}&areaid={areaid}&pageindex={pageindex}&pagesize={pagesize}*/
        [self requestMethod:@"Shop/search" parameter:@{@"keywords":@"",@"provinceid":self.provinceid,@"cityid":self.cityid,@"areaid":self.areaid,@"pageindex":@1,@"pagesize":@40} Success:^(NSDictionary *result) {
            
            ws.areaList = result[@"Data"];
            [ws.tableView reloadData];
            
        } Error:^(NSDictionary *error) {
            
        }];
        
    }
    else {
        /*provinceid={provinceid}&cityid={cityid}*/
        [self requestMethod:@"Address/search" parameter:@{@"provinceid":self.provinceid,
                                                          @"cityid":self.cityid}
                    Success:^(NSDictionary *result) {
                        ws.areaList = result[@"Data"];
                        [ws.tableView reloadData];
                    } Error:^(NSDictionary *error) {
                        
                    }];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.areaList.count+1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == [tableView numberOfRowsInSection:[tableView numberOfSections]-1]-1) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    NSDictionary *area = self.areaList[indexPath.row];
    
    if (self.currentArreaType == AreaTypeShop) {
        cell.textLabel.text = area[@"FullName"];
    }else {
        cell.textLabel.text = area[@"Name"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == [tableView numberOfRowsInSection:[tableView numberOfSections]-1]-1) {
        return;
    }
    
    WS(ws);
    LIUChooseArea *chooseArea = [[LIUChooseArea alloc]init];
    NSDictionary *currentDic = self.areaList[indexPath.row];
    switch (self.currentArreaType) {
        case AreaTypeProvince://当前是省份
        {
            chooseArea.currentArreaType = AreaTypeCityid;
            chooseArea.provinceid = currentDic[@"Id"];
            chooseArea.areaTitle = currentDic[@"Name"];
            chooseArea.cityid = @"";
            chooseArea.chooseAreaBlock = ^(NSDictionary *dic) {
                NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
                [mDic setValue:currentDic forKey:@"province"];
                if (ws.chooseAreaBlock) {
                    ws.chooseAreaBlock(mDic);
                    // [ws.navigationController popViewControllerAnimated:YES];
                    [ws dismissViewControllerAnimated:YES completion:nil];
                }
                
            };
            [self.navigationController pushViewController:chooseArea animated:YES];
        }
            break;
            
        case AreaTypeCityid://当前是城市
        {
            chooseArea.currentArreaType = AreaTypeArea;
            chooseArea.provinceid = @"";//self.provinceid;
            //chooseArea.reallProvinceid = self.provinceid;
            chooseArea.cityid = currentDic[@"Id"];
            chooseArea.areaTitle = currentDic[@"Name"];
            chooseArea.chooseAreaBlock = ^(NSDictionary *dic) {
                NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
                [mDic setValue:currentDic forKey:@"city"];
                if (ws.chooseAreaBlock) {
                    ws.chooseAreaBlock(mDic);
                    [ws.navigationController popViewControllerAnimated:YES];
                }
                
            };
            [self.navigationController pushViewController:chooseArea animated:YES];
        }
            break;
         /*
        case AreaTypeArea://当前是区域
        {
            NSDictionary *mDic = @{@"area":currentDic};
            if (ws.chooseAreaBlock) {
                ws.chooseAreaBlock(mDic);
                [ws.navigationController popViewControllerAnimated:YES];
            }
        }
            break;
            */
            case AreaTypeArea://当前是区域 下一个就要显示shop了
        {
            chooseArea.currentArreaType = AreaTypeShop;
            chooseArea.provinceid = @"";
            chooseArea.cityid = @"";
            chooseArea.areaid = currentDic[@"Id"];
            chooseArea.areaTitle = currentDic[@"Name"];
            chooseArea.chooseAreaBlock = ^(NSDictionary *dic) {
                NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
                [mDic setValue:currentDic forKey:@"area"];
                if (ws.chooseAreaBlock) {
                    ws.chooseAreaBlock(mDic);
                    [ws.navigationController popToRootViewControllerAnimated:YES];
                }
            };
            [self.navigationController pushViewController:chooseArea animated:YES];
        }
            break;
            
            case AreaTypeShop:
        {
            NSDictionary *mDic = @{@"shop":currentDic};
            if (ws.chooseAreaBlock) {
                ws.chooseAreaBlock(mDic);
                [ws.navigationController popViewControllerAnimated:YES];
            }
            
        }
            break;
            
        default:
            break;
    }
    
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
