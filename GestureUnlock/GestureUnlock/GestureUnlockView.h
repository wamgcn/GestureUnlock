//
//  GestureUnlockView.h
//  GestureUnlock
//
//  Created by l x on 2020/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GestureUnlockView;
@protocol GestureUnlockViewDelegate <NSObject>

@optional
-(BOOL)gstureUnlockView:(GestureUnlockView *)gestureUnlockView finishedWithPassword:(NSString *)password;

@end

@interface GestureUnlockView : UIView

@property(nonatomic,weak)id<GestureUnlockViewDelegate> delegate;

-(instancetype)initWithDelegate:(id<GestureUnlockViewDelegate>)delegate;

@end
NS_ASSUME_NONNULL_END
