//
//  FingerprintUnlockView.m
//  GestureUnlock
//
//  Created by l x on 2020/12/3.
//

#import "FingerprintUnlockView.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation FingerprintUnlockView

-(instancetype)initWithDelegate:(id<FingerprintUnlockViewDelegate>)delegate
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    if (self)
    {
        self.delegate = delegate;
        self.backgroundColor = ColorWithRGBValue(0X2C3537);
        
        UIImageView *fingerprintIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"指纹"]];
        [self addSubview:fingerprintIcon];
        
        [fingerprintIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(100);
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).with.offset(-130);
        }];
        
        UILabel *fingerprintLabel = [[UILabel alloc] init];
        fingerprintLabel.text = @"点击进行指纹验证";
        fingerprintLabel.textColor  = ColorWithRGBValue(0xf0f5f9);
        fingerprintLabel.textAlignment = NSTextAlignmentCenter;
        fingerprintLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:fingerprintLabel];
        
        [fingerprintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fingerprintIcon.mas_bottom).with.offset(30);
            make.width.mas_equalTo(200);
            make.centerX.equalTo(fingerprintIcon);
        }];
        
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(fingerprintIdentificationAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fingerprintIcon);
            make.left.and.right.and.bottom.equalTo(fingerprintLabel);
        }];
        [self fingerprintIdentificationAction];
        
        UILabel *moreLabel = [[UILabel alloc] init];
        moreLabel.text = @"手势验证...";
        moreLabel.textColor = ColorWithRGBValue(0xf0f5f9);
        moreLabel.textAlignment = NSTextAlignmentCenter;
        moreLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:moreLabel];
        
        [moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fingerprintLabel.mas_bottom).with.offset(30);
            make.left.and.right.equalTo(fingerprintLabel);
            make.height.mas_equalTo(20);
        }];
        
        UIButton *moreBtn = [[UIButton alloc] init];
        [moreBtn addTarget:self action:@selector(moreIdentificationBtnClickedWithSender:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:moreBtn];
        
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(moreLabel);
            make.centerY.equalTo(moreLabel);
            make.height.mas_equalTo(30);
        }];
        
//        self.userInteractionEnabled = NO;
    }
    
    return self;
}

-(void)fingerprintIdentificationAction
{
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = @"手势验证";
    
    NSString *myLocalizedReasonString = @"请将手指放在Home键上完成验证";
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        WeakSelf
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError * _Nullable error) {
            if (success)
            {
                if (weakSelf.delegate)
                {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        [weakSelf removeFromSuperview];
                        [weakSelf.delegate fingerprintUnlockView:self IdentificationResult:YES];
                    });
                    
                    
                }
            }
            else
            {
                NSLog(@"指纹验证失败");
                self.userInteractionEnabled = YES;
                switch (error.code)
                {
                    case LAErrorUserCancel:
                         //认证被用户取消.例如点击了 cancel 按钮.
                         break;
                                                
                    case LAErrorAuthenticationFailed:
                         // 此处会自动消失，然后下一次弹出的时候，又需要验证数字
                         // 认证没有成功,因为用户没有成功的提供一个有效的认证资格
                         NSLog(@"连输三次后，密码失败");
                         break;
                                                
                    case LAErrorPasscodeNotSet:
                         // 认证不能开始,因为此台设备没有设置密码.
                         NSLog(@"密码没有设置");
                         break;
                                                
                    case LAErrorSystemCancel:
                         //认证被系统取消了(例如其他的应用程序到前台了)
                         NSLog(@"系统取消了验证");
                         break;
                                                
                    case LAErrorUserFallback:
                         //当输入觉的会有问题的时候输入
                         [self removeFromSuperview];
                         [weakSelf.delegate fingerprintUnlockView:self IdentificationResult:NO];
                         NSLog(@"手势登录");
                         break;
                                                
                    default:
                         NSLog(@"您不能访问私有内容");
                         break;
                }
            }
        }];
    }
}

-(void)moreIdentificationBtnClickedWithSender:(UIButton *)sender
{
    [self removeFromSuperview];
    if (_delegate)
    {
        [_delegate fingerprintUnlockView:self IdentificationResult:NO];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
