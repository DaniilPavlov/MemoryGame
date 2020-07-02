import 'dart:async';

Stopwatch watch = new Stopwatch();
Timer timer;
int hundreds = 0;
int mills = 0;
int seconds = 0;
int pingvin = 0;
int minutes = 0;
String elapsedTime = '';

updateTime(Timer timer) {
  if (watch.isRunning) {
    var milliseconds = watch.elapsedMilliseconds;
    hundreds = (milliseconds / 10).truncate();
    seconds = (hundreds / 100).truncate();
    minutes = (seconds / 60).truncate();
    mills = watch.elapsedMilliseconds % 1000;
    elapsedTime = transformMilliseconds(watch.elapsedMilliseconds);
    if (seconds > 59) {
      seconds = seconds - (minutes * 59);
      seconds = seconds - minutes;
    }
  }
}

startWatch() {
  watch.start();
  timer = new Timer.periodic(new Duration(milliseconds: 100), updateTime);
  pingvin = 1;
}

stopWatch() {
  watch.stop();
  setTime();
}

resetWatch() {
  watch.reset();
  setTime();
  hundreds = 0;
  seconds = 0;
  minutes = 0;
  mills = 0;
}

setTime() {
  var timeSoFar = watch.elapsedMilliseconds;
  elapsedTime = transformMilliseconds(timeSoFar);
}

transformMilliseconds(int milliseconds) {
  hundreds = (milliseconds / 10).truncate();
  seconds = (hundreds / 100).truncate();
  minutes = (seconds / 60).truncate();

  String minuteStr = (minutes % 60).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');
  String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
  return "$minuteStr : $secondsStr : $hundredsStr";
}
