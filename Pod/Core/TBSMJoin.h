//
//  TBSMJoin.h
//  TBStateMachine
//
//  Created by Julian Krumow on 20.03.15.
//  Copyright (c) 2014-2015 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBSMPseudoState.h"


@class TBSMState;
@class TBSMParallelState;

/**
 *  This class represents a 'join' pseudo state in a state machine.
 */
@interface TBSMJoin : TBSMPseudoState

@property (nonatomic, strong, readonly, nonnull) TBSMParallelState *region;

/**
 *  Creates a `TBSMJoin` instance from a given name.
 *
 *  Throws a `TBSMException` when name is nil or an empty string.
 *
 *  @param name The specified join name.
 *
 *  @return The join instance.
 */
+ (nullable TBSMJoin *)joinWithName:(nonnull NSString *)name;

/**
 *  The join's source states inside the region.
 *
 *  @return An array containing the source states.
 */
- (nonnull NSArray<__kindof TBSMState *> *)sourceStates;

/**
 *  Sets the source states of the join transition.
 *
 *  Throws a `TBSMException` when parameters are invalid.
 *
 *  @param sourceStates An Array of TBSMState objects.
 *  @param region       The orthogonal region containing the source states.
 *  @param target       The target state.
 */
- (void)setSourceStates:(nonnull NSArray<__kindof TBSMState *> *)sourceStates inRegion:(nonnull TBSMParallelState *)region target:(nonnull TBSMState *)target;

/**
 *  Performs the transition towards the join pseudostate for a given source state.
 *  If all source states have been handled the transition switches to the target state.
 *
 *  @param sourceState The source state to join.
 *
 *  @return `YES` if the complete compound transition has been performed.
 */
- (BOOL)joinSourceState:(nonnull TBSMState *)sourceState;

@end
