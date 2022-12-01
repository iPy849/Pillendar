import 'package:flutter/material.dart';
import 'package:pillendar_app/utils/Utils.dart';
import 'package:pillendar_app/widgets/index.dart';

class MainView extends StatelessWidget with Utils {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FAB(),
      body: SafeArea(
        child: MainLayout(),
      ),
    );
  }
}
