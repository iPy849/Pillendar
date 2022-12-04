import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pillendar_app/firebase/index.dart';
import 'package:pillendar_app/models/reminder.dart';
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseDBController.getInstance().readData(context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return PillItem(
                  reminder: Reminder.fromMap(
                    document.data()! as Map<String, dynamic>,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
