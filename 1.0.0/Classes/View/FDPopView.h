//
//  FDPopView.h
//  FDUIKitObjC
//
//  Created by fandongtongxue on 2020/2/26.
//

#import "FDView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FDPopType) {
    FDPopTypeCenter,
    FDPopTypeBottom
};

@interface FDPopView : FDView

@property(nonatomic, strong) UIView *shadowView;

- (void)show:(UIView *)superView type:(FDPopType)type;

//FDPopTypeCenter 不完全居中，距离顶部位置
- (void)show:(UIView *)superView centerWithTopOffset:(CGFloat)top;


- (void)hide;

@end

NS_ASSUME_NONNULL_END
