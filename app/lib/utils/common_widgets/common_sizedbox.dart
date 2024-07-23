import 'package:flutter/material.dart';

class CommonSizedBox {
  // Factory method to create SizedBox with specified height and width
  static SizedBox sizedBox({required double height, required double width}) {
    assert(
        height >= 10 && height <= 100, 'Height should be between 10 and 100');
    assert(width >= 10 && width <= 100, 'Width should be between 10 and 100');
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
