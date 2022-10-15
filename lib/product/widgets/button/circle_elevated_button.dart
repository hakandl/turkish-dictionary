import 'package:flutter/material.dart';

class TurkceSozlukCircleElevatedButton extends StatelessWidget {
  const TurkceSozlukCircleElevatedButton({super.key, required this.child, this.onPressed});
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        minimumSize: const Size(48, 48),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
