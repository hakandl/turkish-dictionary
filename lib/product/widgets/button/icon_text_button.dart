import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TurkceSozlukIconTextButton extends StatelessWidget {
  const TurkceSozlukIconTextButton({super.key, required this.icon, required this.text, this.textStyle, this.onPressed});
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.highBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 4,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: TextButton.icon(
        label: Text(
          text,
          style: textStyle,
        ),
        icon: icon,
        style: TextButton.styleFrom(
          primary: Colors.transparent,
          fixedSize: const Size(156, 48),
          shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
