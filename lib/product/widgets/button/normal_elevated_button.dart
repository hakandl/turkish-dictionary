import 'package:flutter/material.dart';

import '../../../core/components/button/normal_button.dart';

class TurkishDictionaryNormalElevatedButton extends StatelessWidget {
  const TurkishDictionaryNormalElevatedButton({super.key, this.onPressed, required this.child, this.style});
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
