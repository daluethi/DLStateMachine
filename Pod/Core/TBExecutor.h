//
// Created by Daniel Lüthi on 25.09.17.
// Copyright (c) 2017 SBB AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBSMTransition.h"

@protocol TBExecutor
- (void)execute:(dispatch_block_t)block;
- (void)cancelAllOperations;
@end

@interface TBDirectExecutor : NSObject <TBExecutor>
@end

@interface TBNSOperationQueueExecutor : NSObject <TBExecutor>
+ (instancetype)executorWithOperationQueue:(NSOperationQueue*)queue;
@end