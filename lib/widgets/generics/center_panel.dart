import 'package:flutter/widgets.dart';
import 'package:pillendar_app/theme/index.dart';

class CenterPanelWidget extends StatelessWidget {
  final Widget child;

  const CenterPanelWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Contenedor externo
      margin: const EdgeInsets.all(AppStyleConstants.separation),
      // Acomodar al centro
      child: Center(
        // Caja de formulario
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(AppStyleConstants.cornerRadius),
            ),
          ),
          padding: const EdgeInsets.all(AppStyleConstants.separation),
          child: child,
        ),
      ),
    );
  }
}
