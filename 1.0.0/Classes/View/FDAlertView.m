//
//  FDAlertView.m
//  FDUIKitObjC
//
//  Created by fandongtongxue on 2020/2/27.
//

#import "FDAlertView.h"
#import "FDAction.h"
#import "FDUIDefine.h"
#import "FDUIColorDefine.h"
#import "UIView+FD.h"
#import <YYKit/YYKit.h>
#import <FDFoundationObjC/FDFoundationObjC.h>

@interface FDAlertView ()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *contentLabel;
@property(nonatomic, strong) UIView *bottomLineView;
@property(nonatomic, assign) CGFloat bottomY;
@property(nonatomic, strong) NSMutableArray *actionArray;

@end

@implementation FDAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSAttributedString *)message{
    if (self = [super initWithFrame:CGRectMake(40, FD_ScreenHeight, FD_ScreenWidth - 80, 1)]) {
        self.backgroundColor = FD_WhiteColor;
        self.layer.cornerRadius = 3;
        self.clipsToBounds = YES;
        self.titleLabel.text = title;
        [self.contentLabel setAttributedText:message];
        [self addSubview:self.titleLabel];
        [self addSubview:self.contentLabel];
        self.contentLabel.frame = CGRectMake(10, _titleLabel.fd_bottom, self.fd_width - 20, [message.string fd_textSizeIn:CGSizeMake(self.fd_width - 20, MAXFLOAT) font:[UIFont systemFontOfSize:17 weight:UIFontWeightMedium]].height + 20);
        self.bottomY = self.contentLabel.fd_bottom + 20;
    }
    return self;
}

- (void)addAction:(FDAction *)action{
    [self.actionArray addObject:action];
}

- (void)onClick:(UIButton *)sender{
    NSLog(@"FDAlertView:点击了%@",sender.titleLabel.text);
    FDAction *action = self.actionArray[sender.tag -100];
    if (action.fd_handleAction) {
        action.fd_handleAction();
    }
    [self hide];
}

- (void)show:(UIView *)superView{
    for (NSInteger i = 0; i < self.actionArray.count; i++) {
        CGFloat buttonWidth = (self.width - 30 ) / self.actionArray.count;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10 + (buttonWidth + 10) * i, self.bottomY, buttonWidth, 35)];
        FDAction *action = self.actionArray[i];
        [button setTitle:action.title forState:UIControlStateNormal];
        button.layer.cornerRadius = 3;
        button.clipsToBounds = YES;
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = button.bounds;
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 1);
        if (action.type == FDActionTypeDefault) {
            gl.colors = @[(__bridge id)[UIColor colorWithRed:121/255.0 green:218/255.0 blue:250/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:90/255.0 green:145/255.0 blue:246/255.0 alpha:1.0].CGColor];
            [button setTitleColor:[UIColor colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
        }else{
            gl.colors = @[(__bridge id)[UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1.0].CGColor];
            [button setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
        }
        gl.locations = @[@(0.0),@(1.0f)];
        [button.layer addSublayer:gl];
        
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [button.titleLabel setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightMedium]];
        [self addSubview:button];
        
    }
    
    self.bounds = CGRectMake(0, 0, self.fd_width, self.bottomY + 55);
    [super show:superView type:FDPopTypeCenter];
}

- (NSMutableArray *)actionArray{
    if (!_actionArray) {
        _actionArray = [NSMutableArray array];
    }
    return _actionArray;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, self.fd_width - 20, 25)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _titleLabel.fd_bottom + 20, self.fd_width - 20, 20)];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor colorWithHexString:@"333333"];
    }
    return _contentLabel;
}

@end
