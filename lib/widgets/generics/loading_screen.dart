import 'package:flutter/material.dart';
import 'package:pillendar_app/i18n.dart';
import 'package:pillendar_app/theme/index.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            Padding(
              padding: const EdgeInsets.all(AppStyleConstants.separation),
              child: Text(
                i18n.getText("Loading"),
                style: AppTextStyle.textWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
