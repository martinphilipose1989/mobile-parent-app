import 'package:app/themes_setup.dart';
import 'package:flutter/material.dart';

// NOTE: this is really important, it will make overscroll look the same on both platforms
class _ClampingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

class CommonRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final bool isChildScrollable;

  const CommonRefreshIndicator({
    required this.child,
    required this.onRefresh,
    this.isChildScrollable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((_, constraints) {
        return RefreshIndicator(
          backgroundColor: Colors.white,
          color: AppColors.primary,
          onRefresh: onRefresh,
          child: Visibility(
            visible: isChildScrollable,
            replacement: ScrollConfiguration(
              // Customize scroll behavior for both platforms
              behavior: _ClampingScrollBehavior(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      maxHeight: constraints.maxHeight),
                  child: child,
                ),
              ),
            ),
            child: child,
          ),
        );
      }),
    );
  }
}
