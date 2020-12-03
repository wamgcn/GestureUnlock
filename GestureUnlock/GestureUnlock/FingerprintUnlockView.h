//
//  FingerprintUnlockView.h
//  GestureUnlock
//
//  Created by l x on 2020/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FingerprintUnlockView;

@protocol FingerprintUnlockViewDelegate <NSObject>

@optional

-(void)fingerprintUnlockView:(FingerprintUnlockView *)view IdentificationResult:(BOOL)result;

@end

@interface FingerprintUnlockView : UIView
{
    
}

@property(nonatomic,weak)id<FingerprintUnlockViewDelegate> delegate;

-(instancetype)initWithDelegate:(id<FingerprintUnlockViewDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
