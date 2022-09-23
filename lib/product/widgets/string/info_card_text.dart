import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class InfoCardText extends StatelessWidget {
  const InfoCardText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.onlyTopPaddingMedium.top,
        bottom: context.onlyBottomPaddingLow.bottom,
        left: context.onlyLeftPaddingLow.left,
      ),
      child: Text(
        title,
        style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.background),
      ),
    );
  }
}
