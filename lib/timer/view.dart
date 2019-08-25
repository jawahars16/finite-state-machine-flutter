import 'dart:async';

import 'package:flutter/material.dart';

import '../ui.utils.dart';

class TimerText extends StatefulWidget {
  int _seconds;
  Function tick;
  TimerText(this._seconds, this.tick);
  @override
  State<StatefulWidget> createState() => _TimerState(_seconds, tick);
}

class _TimerState extends State<TimerText> {
  Duration elapsedTime;
  Stopwatch stopwatch;
  Timer timer;
  Function tick;
  int initialDuration;

  void _onTick(timer) {
    if (!mounted) {
      return;
    }
    var elapsedSeconds = initialDuration + stopwatch.elapsed.inSeconds;
    tick(elapsedSeconds);
    setState(() => elapsedTime = Duration(seconds: elapsedSeconds));
  }

  _TimerState(seconds, tick) {
    this.tick = tick;
    this.initialDuration = seconds;
    elapsedTime = Duration(seconds: seconds);
    timer = Timer.periodic(Duration(seconds: 1), this._onTick);
    stopwatch = Stopwatch();
    stopwatch.start();
  }

  String _readabelTimer(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("${_readabelTimer(elapsedTime)}",
        style: TextStyles.displayLarge());
  }
}
