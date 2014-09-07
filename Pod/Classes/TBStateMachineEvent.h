//
//  TBStateMachineEvent.h
//  TBStateMachine
//
//  Created by Julian Krumow on 16.06.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TBStateMachineEvent;
@protocol TBStateMachineNode;


/**
 *  This class represents an event in a state machine.
 */
@interface TBStateMachineEvent : NSObject

/**
 *  The event's name.
 */
@property (nonatomic, copy, readonly) NSString *name;

/**
 *  Creates a `TBStateMachineEvent` instance from a given name.
 *
 *  Throws a `TBStateMachineException` when name is nil or an empty string.
 *
 *  @param name The specified event name.
 *
 *  @return The event instance.
 */
+ (TBStateMachineEvent *)eventWithName:(NSString *)name;

/**
 *  Initializes a `TBStateMachineEvent` with a specified name.
 *
 *  Throws a `TBStateMachineException` when name is nil or an empty string.
 *
 *  @param name The name of this event. Must be unique.
 *
 *  @return An initialized `TBStateMachineEvent` instance.
 */
- (instancetype)initWithName:(NSString *)name;

@end
