import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/svg_enum.dart';
import '../svg.dart';

class DetailWordCard extends StatelessWidget {
  const DetailWordCard({
    Key? key,
    required this.text,
    this.onTap,
    this.isRight = true,
  }) : super(key: key);
  final String text;
  final void Function()? onTap;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: context.lowBorderRadius,
      ),
      child: ListTile(
        title: Text(
          text,
          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
        ),
        trailing: isRight
            ? SvgWidget(
                icon: SvgNameEnum.right.icon,
                color: context.colorScheme.onSecondary,
              )
            : const SizedBox.shrink(),
        onTap: onTap,
      ),
    );
  }
}
