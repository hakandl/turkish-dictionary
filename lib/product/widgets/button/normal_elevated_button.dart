import 'package:flutter/material.dart';
import '../../../core/components/button/normal_button.dart';

class TurkceSozlukNormalElevatedButton extends StatelessWidget {
  const TurkceSozlukNormalElevatedButton({super.key, this.onPressed, required this.child, this.style});
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
