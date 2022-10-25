import 'package:flutter/material.dart';

class TurkishDictionaryCircleElevatedButton extends StatelessWidget {
  const TurkishDictionaryCircleElevatedButton(
      {super.key, required this.child, this.onPressed, this.backgroundColor, this.elevation});
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? elevation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        minimumSize: const Size(48, 48),
        backgroundColor: backgroundColor,
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
