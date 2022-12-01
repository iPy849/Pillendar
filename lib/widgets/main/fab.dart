import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/widgets/main/reminder_setup_modal.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  Future onTapped(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ReminderSetupModal(reason: ReminderSetupModalReason.create);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onTapped(context),
      backgroundColor: AppColors.darkerPrimary,
      splashColor: AppColors.primary,
      isExtended: true,

      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppStyleConstants.separation),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          color: AppColors.white,
          size: AppStyleConstants.separation * 2,
        ),
      ),
      // shape: const CircleBorder(side: BorderSide(color: AppColors.primary)),
    );
  }
}
