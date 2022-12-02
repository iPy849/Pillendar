import 'package:flutter/material.dart';
import 'package:pillendar_app/models/reminder.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/views/index.dart';

class PillItem extends StatelessWidget with Utils {
  const PillItem({super.key, required this.reminder});

  final Reminder reminder;

  void loadEditionDialog(BuildContext context) {
    ReminderForm.reminder = reminder;
    navigateToPath("/form", context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppStyleConstants.separation),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyleConstants.cornerRadius),
        ),
        color: AppColors.darkPrimary,
      ),
      child: ListTile(
        title: Column(
          children: [
            Text(
              reminder.startDayString,
              style: AppTextStyle.headingWhite_1,
            ),
            Text(
              reminder.name,
              style: AppTextStyle.textWhite,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () => loadEditionDialog(context),
          icon: const Icon(
            Icons.edit,
            color: AppColors.white,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
        ),
        contentPadding: const EdgeInsets.all(AppStyleConstants.separation),
      ),
    );
  }
}
