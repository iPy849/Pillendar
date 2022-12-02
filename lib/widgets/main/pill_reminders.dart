import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:pillendar_app/theme/index.dart';
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
            child: FutureBuilder(
          future: FirebaseDBController.getInstance().readData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              var reminders = snapshot.data!;
              return ListView(
                  physics: const BouncingScrollPhysics(),
                  children:
                      reminders.map((e) => PillItem(reminder: e)).toList());
            }

            return const Center(
              child: Text("..."),
            );
          },
          initialData: const [],
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