import 'package:flutter/material.dart';
import 'package:turkce_sozluk/core/components/button/normal_button.dart';

class NormalIconButton extends StatelessWidget {
  const NormalIconButton({super.key, required this.child, this.onPressed, this.style});
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
