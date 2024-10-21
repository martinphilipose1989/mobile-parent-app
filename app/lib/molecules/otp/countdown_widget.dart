import 'package:app/utils/app_typography.dart';
import 'package:app/utils/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountdownWidget extends AnimatedWidget {
  CountdownWidget({
    super.key,
    required this.animation,
    required this.onTimerEnd,
  }) : super(listenable: animation);
  Animation<int> animation;
  final VoidCallback onTimerEnd;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    if (animation.isCompleted) {
      onTimerEnd();
    }
    return CommonText(
      text: "$timerText",
      style:
          AppTypography.caption.copyWith(color: Theme.of(context).primaryColor),
    );
  }
}
