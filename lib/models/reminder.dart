import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:provider/provider.dart';

class Reminder {
  DateTime startDay;
  int dosisTimeInHours;
  String name;
  int cycles;
  late DateTime nextDay;

  Reminder({
    required this.startDay,
    required this.dosisTimeInHours,
    required this.name,
    required this.cycles,
  }) {
    nextDay = startDay;
  }

  void calculateNextDay() {
    if (--cycles < 0) return;
    nextDay = nextDay.add(Duration(hours: dosisTimeInHours));
  }

  saveToFirebase(BuildContext context) {
    String uid = Provider.of<FirebaseAuthController>(context, listen: false)
        .firebaseAuthInstance
        .currentUser!
        .uid;
  }
}
