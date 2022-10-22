import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/svg_enum.dart';
import 'word_card.dart';
import '../svg.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget(
      {super.key, required this.dismissibleKey, required this.title, required this.onTap, required this.onDismissed});
  final String dismissibleKey;
  final void Function(DismissDirection) onDismissed;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(dismissibleKey),
        background: const _DismissibleBackground(),
        secondaryBackground: const _DismissibleBackground(direction: MainAxisAlignment.end),
        onDismissed: onDismissed,
        child: WordCard(
          title: title,
          onTap: onTap,
        ));
  }
}

class _DismissibleBackground extends StatelessWidget {
  const _DismissibleBackground({
    Key? key,
    this.direction,
  }) : super(key: key);
  final MainAxisAlignment? direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.error, borderRadius: context.lowBorderRadius),
      margin: context.horizontalPaddingLow,
      padding: context.horizontalPaddingNormal,
      child: Row(
        mainAxisAlignment: direction ?? MainAxisAlignment.start,
        children: [
          SvgWidget(
            icon: SvgNameEnum.trash.icon,
            color: context.colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
