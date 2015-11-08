//
//  TBSMContainingNode.h
//  TBStateMachine
//
//  Created by Julian Krumow on 23.03.15.
//  Copyright (c) 2014-2015 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBSMNode.h"

@class TBSMParallelState;

/**
 *  This protocol describes a subtype of `TBSMNode` in the state machine hierarchy which can contain other `TBSMNode`s.
 */
@protocol TBSMContainingNode <TBSMNode>

/**
 *  Enters a group of specified states inside a region.
 *
 *  @param sourceState The source state.
 *  @param targetState The target states inside the specified region.
 *  @param region      The target region.
 *  @param data        The payload data.
 */
- (void)enter:(nullable TBSMState *)sourceState targetStates:(nonnull NSArray<__kindof TBSMState *> *)targetStates region:(nonnull TBSMParallelState *)region data:(nullable id)data;

/**
 *  Receives a specified `TBSMEvent` instance.
 *
 *  @param event The given `TBSMEvent` instance.
 *
 *  @return `YES` if the event has been handled.
 */
- (BOOL)handleEvent:(nonnull TBSMEvent *)event;

@end
