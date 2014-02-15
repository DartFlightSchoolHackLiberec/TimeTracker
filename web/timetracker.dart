import 'dart:html';

void main() {
}

class Settings
{
  int getPomodoroWork()
  {
    int work = 25; //TODO settings from user
    return work;
  }

  int getPomodoroShortPause()
  {
    int pause = 5; //TODO settings from user
    return pause;
  }

  int getPomodoroLongPause()
  {
    int pause = 25; //TODO settings from user
    return pause;
  }
}

class Calculation
{
  int hourEstimate;

  num hourCalculation;

  Settings settings;

  Calculation(this.settings, this.hourEstimate);

  num calculate()
  {
    String next = 'pomodoro';
    int work = 0;
    int shortPause = 0;
    int longPause = 0;
    int remain = hourEstimate * 60;

    while (remain > 0) {
      switch (next) {
        case 'pomodoro':
          work++;
          remain -= settings.getPomodoroWork();
          next = (work % 4 == 0) ? 'longPause' : 'shortPause';
          break;
        case 'shortPause':
          shortPause++;
          next = 'pomodoro';
          break;
        case 'longPause':
          longPause++;
          next = 'pomodoro';
          break;
      }
    }

    int minutes = work * settings.getPomodoroWork() + shortPause * settings.getPomodoroShortPause() + longPause * settings.getPomodoroLongPause();
    return hourCalculation = minutes / 60;
  }
}