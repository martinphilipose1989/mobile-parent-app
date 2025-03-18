import 'package:flutter/material.dart';

class ThreeDotLoader extends StatefulWidget {
  final Color? dotColor;
  final double dotSize;
  final Duration duration;

  const ThreeDotLoader({
    super.key,
    this.dotColor,
    this.dotSize = 10.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  ThreeDotLoaderState createState() => ThreeDotLoaderState();
}

class ThreeDotLoaderState extends State<ThreeDotLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();

    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeInOut),
      ),
    );
    _animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(_animation1),
        const SizedBox(width: 5),
        _buildDot(_animation2),
        const SizedBox(width: 5),
        _buildDot(_animation3),
      ],
    );
  }

  Widget _buildDot(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        width: widget.dotSize,
        height: widget.dotSize,
        decoration: BoxDecoration(
          color: widget.dotColor ?? Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
