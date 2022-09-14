import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({super.key, required this.child, this.onPressed, this.style});
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
