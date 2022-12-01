import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/widgets/generics/center_panel.dart';
import 'package:pillendar_app/widgets/index.dart';

class PillReminders extends StatefulWidget {
  const PillReminders({super.key});

  @override
  State<PillReminders> createState() => _PillRemindersState();
}

class _PillRemindersState extends State<PillReminders> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppStyleConstants.cornerRadius * 3),
        ),
        child: CenterPanelWidget(
            child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            PillItem(),
            PillItem(),
            PillItem(),
            PillItem(),
            PillItem(),
            PillItem(),
            PillItem(),
            PillItem(),
          ],
        )));
  }
}

// const [
//               Text("HOLA"),
//               Text("HOLA"),
//               Text("HOLA"),
//               Text("HOLA"),
//               Text("HOLA"),
//             ],;