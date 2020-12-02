//
//  GestureUnlockView.m
//  GestureUnlock
//
//  Created by l x on 2020/12/2.
//

#import "GestureUnlockView.h"

@interface GestureUnlockView()

@property(weak,nonatomic) UIView *lockView;
@property(strong,nonatomic) NSMutableArray *objArray;
@property(assign,nonatomic) CGPoint currentPoint;
@property(strong,nonatomic) UIColor *lineColor;
@property(strong,nonatomic) NSMutableString *password;

@end

@implementation GestureUnlockView

-(instancetype)initWithDelegate:(id<GestureUnlockViewDelegate>)delegate
{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    if (self)
    {
        self.delegate = delegate;
        self.backgroundColor = ColorWithRGBValue(0X2C3537);
        self.lineColor = LineColorBlue;
        
        UIView *view = [[UIView alloc] init];
        [self addSubview:view];
        _lockView = view;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(self.mas_width).with.offset(-60);
            make.center.equalTo(self);
        }];
        
        UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        centerBtn.userInteractionEnabled = NO;
        centerBtn.tag = 4;
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:centerBtn];
        
        [centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(80);
            make.center.equalTo(view);
        }];
        
        UIButton *leftUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftUpBtn.userInteractionEnabled = NO;
        leftUpBtn.tag = 0;
        [leftUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [leftUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [leftUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [leftUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:leftUpBtn];
        
        [leftUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.left.and.top.equalTo(view);
        }];
        
        UIButton *centerUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        centerUpBtn.userInteractionEnabled = NO;
        centerUpBtn.tag = 1;
        [centerUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [centerUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [centerUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [centerUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:centerUpBtn];
        
        [centerUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.centerX.and.top.equalTo(view);
        }];
        
        UIButton *rightUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightUpBtn.userInteractionEnabled = NO;
        rightUpBtn.tag = 2;
        [rightUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [rightUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [rightUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [rightUpBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:rightUpBtn];
        
        [rightUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.right.and.top.equalTo(view);
        }];
        
        UIButton *leftCenterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftCenterBtn.userInteractionEnabled = NO;
        leftCenterBtn.tag = 3;
        [leftCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [leftCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [leftCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [leftCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:leftCenterBtn];
        
        [leftCenterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.left.and.centerY.equalTo(view);
        }];
        
        UIButton *rightCenterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightCenterBtn.userInteractionEnabled = NO;
        rightCenterBtn.tag = 5;
        [rightCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [rightCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [rightCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [rightCenterBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:rightCenterBtn];
        
        [rightCenterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.right.and.centerY.equalTo(view);
        }];
        
        UIButton *leftBottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBottomBtn.userInteractionEnabled = NO;
        leftBottomBtn.tag =6;
        [leftBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [leftBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [leftBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [leftBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:leftBottomBtn];
        
        [leftBottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.left.and.bottom.equalTo(view);
        }];
        
        UIButton *centerBottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        centerBottomBtn.userInteractionEnabled = NO;
        centerBottomBtn.tag = 7;
        [centerBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [centerBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [centerBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [centerBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:centerBottomBtn];
        
        [centerBottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.bottom.and.centerX.equalTo(view);
        }];
        
        UIButton *rightBottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBottomBtn.userInteractionEnabled = NO;
        rightBottomBtn.tag = 8;
        [rightBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点黑"] forState:UIControlStateNormal];
        [rightBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点蓝"] forState:UIControlStateHighlighted ];
        [rightBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点红"] forState:UIControlStateDisabled];
        [rightBottomBtn setBackgroundImage:[UIImage imageNamed:@"圆点绿"] forState:UIControlStateSelected];
        [self addSubview:rightBottomBtn];
        
        [rightBottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(centerBtn);
            make.right.and.bottom.equalTo(view);
        }];
        
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureActionWithSender:)];
        [self addGestureRecognizer:gesture];
    }
    
    return self;
}

#pragma mark -  拖动手势

-(void)gestureActionWithSender:(UIGestureRecognizer *)sender
{
    UIGestureRecognizerState state = sender.state;
    CGPoint loc = [sender locationInView:self];
    
    if (state == UIGestureRecognizerStateBegan)
    {
        [self.subviews enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]])
            {
                BOOL isContains = CGRectContainsPoint(obj.frame, loc);
                
                if (isContains&&obj.highlighted==NO)
                {
                    [self.objArray addObject:obj];
                    obj.highlighted=YES;
                }
            }
        }];
    }
    else if (state == UIGestureRecognizerStateChanged)
    {
        self.currentPoint=loc;
        
        [self.subviews enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([obj isKindOfClass:[UIButton class]])
            {
                BOOL isContains=CGRectContainsPoint(obj.frame, loc);
            
                if (isContains&&obj.highlighted==NO)
                {
                    [self.objArray addObject:obj];
                    obj.highlighted=YES;//改变按钮为蓝色
                }
            }
        }];
        
        [self setNeedsDisplay];
    }
    else if (state == UIGestureRecognizerStateEnded)
    {
        UIButton *lastBtn=[self.objArray lastObject];
        BOOL isOK = NO;
        self.currentPoint=lastBtn.center;
        
        [self setNeedsDisplay];
        
        self.password = [NSMutableString string];
        
        [self.objArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.password appendFormat:@"%@",@(obj.tag)];
        }];
        
        //通过代理方法返回密码进行判断
        if (_delegate)
        {
            isOK = [_delegate gstureUnlockView:self finishedWithPassword:[NSString stringWithString:_password]];
        }
        
        self.userInteractionEnabled = NO;
        
        if (isOK)
        {
            [self.objArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.highlighted = NO;
                obj.selected = YES;
            }];
            self.lineColor = LineColorGreen;
        }
        else
        {
            
            [self.objArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.highlighted = NO;
                obj.enabled = NO;
            }];
            self.lineColor = LineColorRed;
            [self setNeedsDisplay];
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(1.0*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.objArray enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.enabled = YES;
                obj.selected = NO;
            }];
            [self.objArray removeAllObjects];
            self.lineColor = LineColorBlue;
            self.userInteractionEnabled = YES;
            [self setNeedsDisplay];
            
            if (isOK)
            {
                [self removeFromSuperview];
            }
        });
    }
}

#pragma mark -  图形绘制

-(void)drawRect:(CGRect)rect
{
    if (self.objArray==nil)
    {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [self.objArray enumerateObjectsUsingBlock:^(__kindof UIButton *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[UIButton class]])
        {
            if (idx == 0)
            {
                [path moveToPoint:obj.center];
            }
            else
            {
                [path addLineToPoint:obj.center];
            }
        }
        
    }];
    
    [path addLineToPoint:_currentPoint];
    
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [self.lineColor setStroke];
    [path stroke];
}

#pragma mark -  懒加载

LazyLoad(NSMutableArray, objArray, {
    z = [NSMutableArray array];
})

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
