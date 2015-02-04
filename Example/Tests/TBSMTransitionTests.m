//
//  TBSMTransitionTests.m
//  TBStateMachineTests
//
//  Created by Julian Krumow on 28.09.14.
//  Copyright (c) 2014 Julian Krumow. All rights reserved.
//

#import <TBStateMachine/TBSMStateMachine.h>

SpecBegin(TBSMTransition)

__block TBSMState *stateA;
__block TBSMState *stateB;


describe(@"TBSMTransition", ^{
    
    beforeEach(^{
        stateA = [TBSMState stateWithName:@"a"];
        stateB = [TBSMState stateWithName:@"b"];
    });
    
    afterEach(^{
        stateA = nil;
        stateB = nil;
    });
    
    it (@"returns its name.", ^{
        TBSMTransition *transition = [TBSMTransition transitionWithSourceState:stateA targetState:nil type:TBSMTransitionInternal action:nil guard:nil];
        expect(transition.name).to.equal(@"a");
        
        transition = [TBSMTransition transitionWithSourceState:stateA targetState:stateB type:TBSMTransitionExternal action:nil guard:nil];
        expect(transition.name).to.equal(@"a_to_b");
    });
    
    it (@"returns source state.", ^{
        TBSMTransition *transition = [TBSMTransition transitionWithSourceState:stateA targetState:stateB type:TBSMTransitionExternal action:nil guard:nil];
        expect(transition.sourceState).to.equal(stateA);
    });
    
    it (@"returns destination state.", ^{
        TBSMTransition *transition = [TBSMTransition transitionWithSourceState:stateA targetState:stateB type:TBSMTransitionExternal action:nil guard:nil];
        expect(transition.targetState).to.equal(stateB);
    });
    
    it (@"returns action block.", ^{
        
        TBSMActionBlock action = ^(TBSMState *sourceState, TBSMState *targetState, NSDictionary *data) {
            
        };
        
        TBSMTransition *transition = [TBSMTransition transitionWithSourceState:stateA targetState:stateB type:TBSMTransitionExternal action:action guard:nil];
        expect(transition.action).to.equal(action);
    });
    
    it (@"returns guard block.", ^{
        
        TBSMGuardBlock guard = ^BOOL(TBSMState *sourceState, TBSMState *targetState, NSDictionary *data) {
            return YES;
        };
        
        TBSMTransition *transition = [TBSMTransition transitionWithSourceState:stateA targetState:stateB type:TBSMTransitionExternal action:nil guard:guard];
        expect(transition.guard).to.equal(guard);
    });
});

SpecEnd
