import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class IntrinsicHeightCard extends StatelessWidget {
  const IntrinsicHeightCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 3,
              height: double.infinity,
              color: context.colorScheme.secondary,
              margin: EdgeInsets.only(
                left: context.onlyLeftPaddingNormal.left,
                top: context.onlyTopPaddingNormal.top,
                bottom: context.onlyBottomPaddingNormal.bottom,
              ),
            ),
            Expanded(
              child: Padding(padding: context.paddingNormal, child: child),
            ),
          ],
        ),
      ),
    );
  }
}
