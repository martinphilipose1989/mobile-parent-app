import 'package:app/themes_setup.dart';
import 'package:app/utils/app_typography.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {super.key, required this.toggleCondition, required this.title});

  final bool toggleCondition;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: toggleCondition
              ? Theme.of(context).colorScheme.primary
              : AppColors.textNeutral35,
        ),
        borderRadius: BorderRadius.circular(12),
        color: toggleCondition
            ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
            : Colors.white,
      ),
      child: Center(
        child: Text(
          title,
          style: AppTypography.subtitle2.copyWith(
            color: toggleCondition
                ? Theme.of(context).colorScheme.primary
                : AppColors.textNeutral35,
          ),
        ),
      ),
    );
  }
}
