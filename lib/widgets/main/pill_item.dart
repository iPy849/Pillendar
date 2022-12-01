import 'package:flutter/material.dart';
import 'package:pillendar_app/models/reminder.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/widgets/main/reminder_setup_modal.dart';

class PillItem extends StatelessWidget {
  const PillItem({super.key, this.reminder});

  final Reminder? reminder;

  Future loadEditionDialog(BuildContext context) {
    // TODO: que cargue el reminder
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ReminderSetupModal(
          reason: ReminderSetupModalReason.edit,
          reminder: reminder,
        );
      },
    );
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
          children: const [
            Text(
              "9:15pm",
              style: AppTextStyle.headingWhite_1,
            ),
            Text(
              "Nombre de la pastilla",
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
