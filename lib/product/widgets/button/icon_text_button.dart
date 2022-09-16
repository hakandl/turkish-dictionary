import 'package:flutter/material.dart';

class TurkceSozlukIconTextButton extends StatelessWidget {
  const TurkceSozlukIconTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.onPressed,
    this.fixedSizeWidth,
  });
  final String text;
  final TextStyle? textStyle;
  final double? fixedSizeWidth;
  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        text,
        style: textStyle,
      ),
      icon: icon,
      style: TextButton.styleFrom(
        fixedSize: Size(fixedSizeWidth ?? 156, 48),
      ),
      onPressed: onPressed,
    );
  }
}
