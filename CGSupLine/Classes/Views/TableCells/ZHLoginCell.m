//
//  ZHLoginCell.m
//  CGSupLine
//
//  Created by 刘俊 on 15/9/22.
//  Copyright © 2015年 Michael. All rights reserved.
//

#import "ZHLoginCell.h"
#import "ZHButton.h"
#import "LIUCustomSwitch.h"
#import "ZHChooseLoginType.h"

@interface ZHLoginCell ()<LIUCustomSwitchDelegate>

@property (weak, nonatomic) IBOutlet UIView *inputSupperView;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@property (weak, nonatomic) IBOutlet UIButton *rememberButton;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (nonatomic,strong) LIUCustomSwitch  *customSwitch;

@property (nonatomic,strong) ZHChooseLoginType *chooseTypeView;


@end

@implementation ZHLoginCell

- (ZHChooseLoginType *)chooseTypeView {
    if (_chooseTypeView) {
        return _chooseTypeView;
    }
    WS(ws);
    NSArray *data = @[@"总部",@"供应商",@"门店"];
    NSInteger index = [data indexOfObject:self.typeLabel.text];
    _chooseTypeView = [ZHChooseLoginType   viewWithDataSource:data FirstIndex:index];
    _chooseTypeView.didChooseLoginTypeblock = ^(NSString *str) {
        ws.typeLabel.text = str;
    };
    return _chooseTypeView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.typeLabel.text = @"总部";
     [self creatUI];
}

- (void)creatUI {
    
    self.inputSupperView.layer.cornerRadius = 5.0;
    self.inputSupperView.layer.masksToBounds = YES;
    
    //self.pwdTextField.delegate = self;
    self.phoneTextField.tintColor = kThemeColor;
    self.pwdTextField.tintColor = kThemeColor;
    
    self.customSwitch = [[LIUCustomSwitch alloc]initWithFrame:CGRectMake(kScreenWidth-80, 200, 50, 25)];
    self.customSwitch.delegate = self;
    [self addSubview:self.customSwitch];
    
    //获取登陆信息
    NSDictionary *loginInfo = [ZHConfigObj getLoginInfo];
    if (loginInfo) {
        NSString *phone = loginInfo[@"phone"];
        self.phoneTextField.text = phone;
        NSString *pwd = loginInfo[@"pwd"];
        self.pwdTextField.text = pwd;
        BOOL  isRemember = [loginInfo[@"isRemember"] boolValue];
        self.rememberButton.selected = isRemember;
        NSString *type = loginInfo[@"type"];
        self.typeLabel.text = type;
    }
    
}

- (IBAction)chooseLoginType:(UIButton *)sender {
    
    [self.chooseTypeView show];
    
}

- (void)switchDidTapWithStatue:(BOOL)statue {
    
    self.pwdTextField.secureTextEntry = !statue;
    
}

- (IBAction)rememberDidTap:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

- (IBAction)loginButton:(ZHButton *)sender {
    
    if (kTextFieldIsNill(self.phoneTextField.text)) {
        [SVProgressHUD showWithStatus:@"请输入账号"];
        return;
    }
    
    if (kTextFieldIsNill(self.pwdTextField.text)) {
        [SVProgressHUD showWithStatus:@"请输入密码"];
        return;
    }
    
    if (self.didTapLoginBlock) {
        NSDictionary *dic = @{@"phone":self.phoneTextField.text,@"pwd":self.pwdTextField.text,@"isRemember":@(self.rememberButton.isSelected),@"type":self.typeLabel.text};
        self.didTapLoginBlock(dic);
    }
    
}

@end
