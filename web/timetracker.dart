import 'dart:html';
import 'dart:async';


Settings setup = new Settings();

Counter counter = new Counter(); 


void initAll()
{
  print('volam');
    
  setup.getSettingFromForm();
  

  counter.setNode( querySelector('#counterBack') );
  counter.init();
  counter.startTimer();  

}


void main() {
  
 
  setup.getSettingFromForm();
  
  
  //start Pomodoro
  querySelector('#startPomodoro').onClick.listen( (e) => initAll());
  
  //reset na neco
  
  //querySelector('#startPomodoro').listen( (e) => initAll());
  
  //chci aby se el vynuloval vzdy kdyz dojde k metode reset()
  
  querySelector('#startPomodoro').on['dynamiceventname'].listen(
      (event) => print('dynamic!'));
    
  
}



class Settings
{
  
  int settingUnitLength;
  int settingLongBreak;
  int settingShortBreak;
  
  void getSettingFromForm()
  {
    this.settingUnitLength = int.parse( querySelector("#settingUnitLength").value).floor();
    this.settingShortBreak = int.parse( querySelector("#settingShortBreak").value).floor();
    this.settingLongBreak = int.parse( querySelector("#settingLongBreak").value).floor();
    
  }
  
  int getPomodoroWork()
  {
    //int work = 25; //TODO settings from user
    return this.settingUnitLength;
  }

  int getPomodoroShortPause()
  {
    //int pause = 5; //TODO settings from user
    return this.settingShortBreak;
  }

  int getPomodoroLongPause()
  {
    //int pause = 25; //TODO settings from user
    return this.settingLongBreak;
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



//mike

class Counter
{
  HtmlElement node;
  
  int startminutes;
  int minutes;
  int seconds;
  
  Timer timer;
  
  Results result;
  
  
  static final Counter _singleton = new Counter._internal();
  
  //set Results(result);
       
  Counter() {
    //return _singleton;
  }
  
  
  get results => this.result;
  
  void set results(Results res) {
    result = res;
  }
  
  
  setNode(HtmlElement val) {
    this.node = val; 
  }

  //set node(HtmlElement value) => node = value;
  
  Counter._internal() {
     // initialization logic here
     
  }
    
  void init() { 
   
    this.minutes = this.startminutes = int.parse( querySelector("#settingUnitLength").value).floor();
    this.seconds = 0;
     
   
  }
  
  void refreshHtml()
  {    
    node.querySelector('#minutes').text = this.minutes.toString();
    node.querySelector('#seconds').text = this.seconds.toString();                      
  }
  
  
  void startTimer()
  {
    
    print('startuji timer');
    
    
    //this.timer = new Timer(new Duration(seconds: this.minutes * 60), handleTimeout);
    
    this.timer = new Timer.periodic(new Duration(seconds: 1), handleTimeout);

    //timer.cancel();
    
  
  }
  
    void handleTimeout(Timer _) {  // callback function
      //print('handleTimeout');
               
      if (seconds == 0) 
      {  
        seconds = 59;
        
        
        if (minutes == 0)
        {
          //completed pomodoro
          this.addPomodoro();
          
          this.stop();
        }
        else 
        {
          minutes--;      
        }       
        
      }
           
      this.seconds--;     
      
      refreshHtml();
      
      return;
      
    }
    
    void setMinutes()
    {
      
    }
    
    void setSeconds()
    {
      
    }
    
    void reset()
    {
      this.minutes = this.startminutes;
      this.seconds = 59;
      refreshHtml();         
      
      print('reseting');
    }
    
    void stop()
    {
    
      this.timer.cancel();
      
    }
    
    void ring()
    {
      
    }
    
    void addPomodoro()
    {
      print('add pomodoro');
    }

    void restart()
    {
      
    }
     
  
}

class Results
{
    
  
  void addEstimate()
  {
     
    SpanElement sp = new SpanElement();
    
  }
  
}




