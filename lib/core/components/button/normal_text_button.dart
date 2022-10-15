import 'package:flutter/material.dart';
import 'normal_button.dart';

class TitleTextButton extends StatelessWidget {
  const TitleTextButton({super.key, required this.text, this.onPressed, this.style});
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      style: style,
      child: Text(text),
    );
  }
}
