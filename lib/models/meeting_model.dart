import 'dart:ui';

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;

  DateTime from;

  DateTime to;

  Color background;

  bool isAllDay;

  @override
  String toString() {
    return "Meeting(eventName: $eventName, from: $from, to: $to, background: $background, isAllDay: $isAllDay)";
  }
}
