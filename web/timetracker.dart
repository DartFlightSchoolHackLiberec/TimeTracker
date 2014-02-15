import 'dart:html';

void main() {
  querySelector("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);
}

void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
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
