import 'package:flutter/material.dart';
import 'package:hello_world/statemachine.dart' as sm;
import 'package:hello_world/stopwatch/state.dart';
import 'package:hello_world/timer/view.dart';
import 'package:hello_world/ui.utils.dart';

class _StopwatchState extends State<Stopwatch> {
  sm.StateMachine timerState;
  int elapsedSeconds;

  _StopwatchState() {
    this.timerState = stopwatchStateMachine;
    this.elapsedSeconds = 0;
  }

  void _onAction(String action) {
    this.setState(() => this.timerState.transition(action));
    this.elapsedSeconds =
        timerState.currentState == 'initial' ? 0 : this.elapsedSeconds;
  }

  void _tick(int seconds) {
    setState(() {
      this.elapsedSeconds = timerState.currentState == 'initial' ? 0 : seconds;
    });
  }

  Widget timer() {
    if (timerState.currentState == 'idle') {
      return Text('${this.elapsedSeconds}s', style: TextStyles.displayLarge());
    } else if (timerState.currentState == 'running') {
      return TimerText(elapsedSeconds, _tick);
    } else if (timerState.currentState == 'initial') {
      return Text('0s', style: TextStyles.displayLarge());
    }

    return null;
  }

  List<Widget> buttons() {
    if (timerState.currentState == 'idle') {
      return [
        ActionButton('Resume', () => _onAction('start')),
        ActionButton('Stop', () => _onAction('stop'))
      ];
    } else if (timerState.currentState == 'running') {
      return [
        ActionButton('Pause', () => _onAction('pause')),
        ActionButton('Stop', () => _onAction('stop'))
      ];
    } else if (timerState.currentState == 'initial') {
      return [ActionButton('Start', () => _onAction('start'))];
    }

    return null; // Just to avoid warning
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: timer(),
            margin: EdgeInsets.only(top: 50, bottom: 50),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: buttons())
        ]);
  }
}

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}
