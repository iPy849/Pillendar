class Reminder {
  late DateTime startDay;
  late int dosisTimeInHours;
  late String name;
  late int cycles;
  late DateTime nextDay;

  String get id => "$startDay-$name";

  String get startDayString => startDay.toString().substring(0, 10);

  Reminder({
    required this.startDay,
    required this.dosisTimeInHours,
    required this.name,
    required this.cycles,
  }) {
    nextDay = startDay;
  }

  Reminder.fromMap(Map<String, dynamic> data) {
    startDay = data["startDay"].toDate();
    dosisTimeInHours = data["dosisTimeInHours"];
    name = data["name"];
    cycles = data["cycles"];
  }

  void calculateNextDay() {
    if (--cycles < 0) return;
    nextDay = nextDay.add(Duration(hours: dosisTimeInHours));
  }

  Map<String, dynamic> toMap() {
    return {
      "startDay": startDay,
      "dosisTimeInHours": dosisTimeInHours,
      "name": name,
      "cycles": cycles
    };
  }
}
