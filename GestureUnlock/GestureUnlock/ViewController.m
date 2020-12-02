//
//  ViewController.m
//  GestureUnlock
//
//  Created by l x on 2020/12/2.
//

#import "ViewController.h"
#import "GestureUnlockView.h"

@interface ViewController ()<GestureUnlockViewDelegate>
{
    NSString *_password;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _password = @"0124876";
    
    GestureUnlockView *view = [[GestureUnlockView alloc] initWithDelegate:self];
    [self.view addSubview:view];
}

-(BOOL)gstureUnlockView:(GestureUnlockView *)gestureUnlockView finishedWithPassword:(NSString *)password
{
    if ([password isEqualToString:_password])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    return NO;
}

@end
