import 'dart:html';

void main() {
}

class Settings
{
  int work;
  int shortBreak;
  int longBreak;

  Settings(this.work, this.shortBreak, this.longBreak);}

class Calculation
{
  int hourEstimate;
  int hourCalculation;
  List steps = [];
  Settings settings;

  Calculation(this.settings, this.hourEstimate);

  List calculate()
  {
    String nextStep = 'work';
    int work = 0;
    int shortBreak = 0;
    int longBreak = 0;
    int remain = hourEstimate * 60;

    while (remain > 0) {
      switch (nextStep) {
        case 'work':
          steps.add('work');
          work++;
          remain -= settings.work;
          nextStep = (work % 4 == 0) ? 'longBreak' : 'shortBreak';
          break;
        case 'shortBreak':
          steps.add('shortBreak');
          shortBreak++;
          nextStep = 'work';
          break;
        case 'longBreak':
          steps.add('longBreak');
          longBreak++;
          nextStep = 'work';
          break;
      }
    }

    int minutes = work * settings.work + shortBreak * settings.shortBreak + longBreak * settings.longBreak;
    hourCalculation = (minutes / 60).round();

    return steps;
  }
}

class Task
{
  String name;
  int level;
  int hourEstimate;
  int hourCalculate;

  Task(this.name, this.level, this.hourEstimate);


}

