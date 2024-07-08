import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool? softWrap;
  final double? textScaleFactor;

  const CommonText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.textDirection,
    this.softWrap,
    this.textScaleFactor = 1.0, // Default to 1.0 to maintain consistent size
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
      softWrap: softWrap,
      textScaler: TextScaler.linear(textScaleFactor ?? 1.0),
    );
  }
}
