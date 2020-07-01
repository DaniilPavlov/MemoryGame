import 'dart:async';

import 'package:flutterapp2/model/tile_model.dart';

int seconds = 0;
int minutes = 0;

void startTimer() {
//  seconds = 0;
////  my_timer = Timer.periodic(Duration(seconds: 1), (timer) {
////    seconds++;
////  });
  timer.cancel();
  isActive = true;
  secondsPassed = 0;
  timer = Timer.periodic(duration, (Timer t) {
    handleTick();
  });
}

void stopTimer() {
  isActive = false;
  secondsPassed = 0;
  seconds = 0;
}

const duration = const Duration(seconds: 1);

int secondsPassed = 0;
bool isActive = false;

Timer timer;

void handleTick() {
  if (isActive) {
    secondsPassed = secondsPassed + 1;
    seconds = secondsPassed;
    minutes = secondsPassed ~/ 60;
  }
}
