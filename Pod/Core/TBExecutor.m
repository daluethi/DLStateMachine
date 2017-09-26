//
// Created by Daniel Lüthi on 25.09.17.
// Copyright (c) 2017 SBB AG. All rights reserved.
//

#import "TBExecutor.h"

@implementation TBDirectExecutor
- (void)execute:(dispatch_block_t)block
{
    block();
}

- (void)cancelAllOperations
{
}

@end

@interface TBNSOperationQueueExecutor ()
@property (nonatomic, strong) NSOperationQueue* queue;
@end

@implementation TBNSOperationQueueExecutor
+ (instancetype)executorWithOperationQueue:(NSOperationQueue*)queue;
{
    return [[TBNSOperationQueueExecutor alloc] initWithOperationQueue:queue];
}

- (instancetype)initWithOperationQueue:(NSOperationQueue*)queue
{
    self = [super init];
    if (self) {
        self.queue = queue;
    }
    return self;
}

- (void)execute:(dispatch_block_t)block
{
    [self.queue addOperationWithBlock:block];
}

- (void)cancelAllOperations
{
    [self.queue cancelAllOperations];
}

@end