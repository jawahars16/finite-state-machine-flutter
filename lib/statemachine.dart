import 'package:flutter/foundation.dart';

class Transition {
  String action;
  String targetState;
  Transition({@required this.action, @required this.targetState});
}

class State {
  List<Transition> transitions;
  State(this.transitions);
}

class StateMachine {
  Map<String, State> _states;
  String _currentState;
  
  String get currentState => _currentState;

  StateMachine(states, String initialState) {
    this._states = states;
    this._currentState = initialState;
  }

  void transition(String action) {
    this._currentState = this
        ._states[_currentState]
        .transitions
        .firstWhere((t) => t.action == action)
        .targetState;
  }
}
