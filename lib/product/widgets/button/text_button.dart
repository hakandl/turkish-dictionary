import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/button/normal_text_button.dart';

class TurkceSozlukTextButton extends StatelessWidget {
  const TurkceSozlukTextButton({super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: text,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        primary: Colors.black,
        textStyle: context.textTheme.bodyText1,
      ),
      onPressed: () => context.pop(),
    );
  }
}
