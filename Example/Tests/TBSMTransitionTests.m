//
//  TBSMTransitionTests.m
//  TBStateMachineTests
//
//  Created by Julian Krumow on 28.09.14.
//  Copyright (c) 2014-2015 Julian Krumow. All rights reserved.
//

#import <TBStateMachine/TBSMStateMachine.h>

SpecBegin(TBSMTransition)

__block TBSMState *a;
__block TBSMState *b;


describe(@"TBSMTransition", ^{
    
    beforeEach(^{
        a = [TBSMState stateWithName:@"a"];
        b = [TBSMState stateWithName:@"b"];
    });
    
    afterEach(^{
        a = nil;
        b = nil;
    });
    
    it (@"returns its name.", ^{
        TBSMTransition *transition = [[TBSMTransition alloc] initWithSourceState:a targetState:nil kind:TBSMTransitionInternal action:nil guard:nil];
        expect(transition.name).to.equal(@"a");
        
        transition = [[TBSMTransition alloc] initWithSourceState:a targetState:b kind:TBSMTransitionExternal action:nil guard:nil];
        expect(transition.name).to.equal(@"a --> b");
    });
    
    it (@"returns source state.", ^{
        TBSMTransition *transition = [[TBSMTransition alloc] initWithSourceState:a targetState:b kind:TBSMTransitionExternal action:nil guard:nil];
        expect(transition.sourceState).to.equal(a);
    });
    
    it (@"returns target state.", ^{
        TBSMTransition *transition = [[TBSMTransition alloc] initWithSourceState:a targetState:b kind:TBSMTransitionExternal action:nil guard:nil];
        expect(transition.targetState).to.equal(b);
    });
    
    it (@"returns action block.", ^{
        
        TBSMActionBlock action = ^(TBSMState *sourceState, TBSMState *targetState, id data) {
            
        };
        
        TBSMTransition *transition = [[TBSMTransition alloc] initWithSourceState:a targetState:b kind:TBSMTransitionExternal action:action guard:nil];
        expect(transition.action).to.equal(action);
    });
    
    it (@"returns guard block.", ^{
        
        TBSMGuardBlock guard = ^BOOL(TBSMState *sourceState, TBSMState *targetState, id data) {
            return YES;
        };
        
        TBSMTransition *transition = [[TBSMTransition alloc] initWithSourceState:a targetState:b kind:TBSMTransitionExternal action:nil guard:guard];
        expect(transition.guard).to.equal(guard);
    });
    
    it(@"Throws a `TBSMException` if no lca was found.", ^{
    
        expect(^{
            TBSMTransition *transition = [[TBSMTransition alloc] initWithSourceState:a targetState:b kind:TBSMTransitionExternal action:nil guard:nil];
            [transition performTransitionWithData:nil];
        }).to.raise(TBSMException);
    
    });
});

SpecEnd
