//
//  HLHLotteryObject.h
//  YouYiMeiDemo
//
//  Created by book on 2018/11/14.
//  Copyright © 2018年 book. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol HLHLotteryProtocol<JSExport>

- (void)goLogin;

@end

@protocol HLHLotteryDelegate <NSObject>

- (void)goLoginAction;

@end


@interface HLHLotteryObject : NSObject<HLHLotteryProtocol,HLHLotteryDelegate>

@property (nonatomic, weak) id<HLHLotteryDelegate>  delegate;

@end
