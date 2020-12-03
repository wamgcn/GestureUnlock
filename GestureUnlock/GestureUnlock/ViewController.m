//
//  ViewController.m
//  GestureUnlock
//
//  Created by l x on 2020/12/2.
//

#import "ViewController.h"
#import "GestureUnlockView.h"
#import "FingerprintUnlockView.h"

@interface ViewController ()<GestureUnlockViewDelegate,FingerprintUnlockViewDelegate>
{
    NSString *_password;
}
@property (weak, nonatomic) IBOutlet UILabel *label;

@property(weak,nonatomic)GestureUnlockView *gestureUnlockView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _password = @"0124876";
    
    GestureUnlockView *view = [[GestureUnlockView alloc] initWithDelegate:self];
    [self.view addSubview:view];
    _gestureUnlockView = view;
    
    FingerprintUnlockView *fuView = [[FingerprintUnlockView alloc] initWithDelegate:self];
    [self.view addSubview:fuView];
}

-(BOOL)gstureUnlockView:(GestureUnlockView *)gestureUnlockView finishedWithPassword:(NSString *)password
{
    if ([password isEqualToString:_password])
    {
        _label.text = @"手势验证成功";
        return YES;
    }
    else
    {
        return NO;
    }
    
    return NO;
}

#pragma mark -  FingerprintUnlockViewDelegate

-(void)fingerprintUnlockView:(FingerprintUnlockView *)view IdentificationResult:(BOOL)result
{
    if (result)
    {
        _label.text = @"指纹验证成功";
        [_gestureUnlockView removeFromSuperview];
    }
}

@end
