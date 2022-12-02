import 'package:flutter/material.dart';
import 'package:pillendar_app/theme/index.dart';
import 'package:pillendar_app/utils/Utils.dart';

class FAB extends StatelessWidget with Utils {
  const FAB({super.key});

  void onTapped(BuildContext context) {
    navigateToPath('/form', context);
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
