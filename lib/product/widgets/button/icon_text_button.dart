import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';

class TurkishDictionaryIconTextButton extends StatelessWidget {
  const TurkishDictionaryIconTextButton({
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
        fixedSize: Size(fixedSizeWidth ?? context.dynamicWidth(SizeEnum.zFour.value), SizeEnum.fortyEight.value),
      ),
      onPressed: onPressed,
    );
  }
}
