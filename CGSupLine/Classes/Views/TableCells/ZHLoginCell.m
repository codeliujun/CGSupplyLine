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

@interface ZHLoginCell ()<LIUCustomSwitchDelegate>

@property (weak, nonatomic) IBOutlet UIView *inputSupperView;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@property (weak, nonatomic) IBOutlet UIButton *rememberButton;

@property (nonatomic,strong) LIUCustomSwitch  *customSwitch;

@end

@implementation ZHLoginCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self creatUI];
}

- (void)creatUI {
    
    self.inputSupperView.layer.cornerRadius = 5.0;
    self.inputSupperView.layer.masksToBounds = YES;
    
    //self.pwdTextField.delegate = self;
    self.phoneTextField.tintColor = kThemeColor;
    self.pwdTextField.tintColor = kThemeColor;
    
    self.customSwitch = [[LIUCustomSwitch alloc]initWithFrame:CGRectMake(kScreenWidth-80, 156, 50, 25)];
    self.customSwitch.delegate = self;
    [self addSubview:self.customSwitch];
    
    //获取登陆信息
    NSDictionary *loginInfo = [ZHConfigObj getLoginInfo];
    if (loginInfo) {
        NSString *phone = loginInfo[@"phone"];
        self.pwdTextField.text = phone;
        NSString *pwd = loginInfo[@"pwd"];
        self.pwdTextField.text = pwd;
        BOOL  isRemember = [loginInfo[@"isRemember"] boolValue];
        self.rememberButton.selected = isRemember;
    }
    
    
    
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
        NSDictionary *dic = @{@"phone":self.phoneTextField.text,@"pwd":self.pwdTextField.text,@"isRemember":@(self.rememberButton.isSelected)};
        self.didTapLoginBlock(dic);
    }
    
}

@end
