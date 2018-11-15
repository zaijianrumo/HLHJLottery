//
//  HLHLotteryObject.m
//  YouYiMeiDemo
//
//  Created by book on 2018/11/14.
//  Copyright © 2018年 book. All rights reserved.
//

#import "HLHLotteryObject.h"

@implementation HLHLotteryObject

-(void)goLogin{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goLoginAction)]) {
        [self.delegate goLoginAction];
    }
    
}

- (void)goLoginAction {
}

@end
