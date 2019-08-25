import 'package:hello_world/statemachine.dart';

var stopwatchStateMachine = StateMachine({
  'running': State([
    Transition(action: 'pause', targetState: 'idle'),
    Transition(action: 'stop', targetState: 'initial')
  ]),
  'idle': State([
    Transition(action: 'start', targetState: 'running'),
    Transition(action: 'stop', targetState: 'initial')
  ]),
  'initial': State([
    Transition(action: 'start', targetState: 'running')
  ])
}, 'initial');