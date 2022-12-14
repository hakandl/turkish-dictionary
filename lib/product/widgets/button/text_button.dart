import 'package:flutter/material.dart';

import '../../../core/components/button/normal_text_button.dart';

class TurkishDictionaryTextButton extends StatelessWidget {
  const TurkishDictionaryTextButton({super.key, this.onPressed, required this.text, this.textStyle});
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: text,
      style: TextButton.styleFrom(
        textStyle: textStyle,
      ),
      onPressed: onPressed,
    );
  }
}
