import 'package:flutter/material.dart';
import 'package:turkce_sozluk/core/components/button/normal_icon_button.dart';

class TurkceSozlukIconButton extends StatelessWidget {
  const TurkceSozlukIconButton(
      {super.key, this.onPressed, required this.child, this.backgroundColor = Colors.transparent});
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NormalIconButton(
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: backgroundColor,
        primary: Colors.black,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
