import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final int? maxLines;
  final bool showSearchIcon;
  final Widget? prefix;

  const CommonTextFormField(
      {super.key,
      this.labelText,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.hintText,
      this.validator,
      this.obscureText = false,
      this.decoration,
      this.maxLines,
      this.showSearchIcon = false,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText == null
            ? const SizedBox()
            : Text(
                labelText ?? "",
                style: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
        labelText == null ? const SizedBox() : const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          cursorHeight: 20,
          style: Theme.of(context).textTheme.titleSmall,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines ?? 1,
          decoration: decoration ??
              InputDecoration(
                prefixIcon: prefix,
                hintText: hintText ?? '[Insert]',
              ),
        ),
      ],
    );
  }
}
