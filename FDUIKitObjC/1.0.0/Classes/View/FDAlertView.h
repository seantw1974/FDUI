//
//  FDAlertView.h
//  FDUIKitObjC
//
//  Created by fandongtongxue on 2020/2/27.
//

#import "FDPopView.h"
@class FDAction;

NS_ASSUME_NONNULL_BEGIN

@interface FDAlertView : FDPopView

- (instancetype)initWithTitle:(NSString *)title message:(NSAttributedString *)message;

- (void)addAction:(FDAction *)action;

- (void)show:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
