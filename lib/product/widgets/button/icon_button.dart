import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../constants/enums/size_enum.dart';
import '../../../core/components/button/normal_icon_button.dart';

class TurkishDictionaryIconButton extends StatelessWidget {
  const TurkishDictionaryIconButton(
      {super.key, this.onPressed, required this.child, this.backgroundColor = Colors.transparent});
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NormalIconButton(
      style: TextButton.styleFrom(
        foregroundColor: context.colorScheme.background,
        shape: const CircleBorder(),
        backgroundColor: backgroundColor,
        elevation: SizeEnum.zero.value,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
