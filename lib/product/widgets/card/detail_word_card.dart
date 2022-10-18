import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';

import '../../constants/enums/svg_enum.dart';
import '../svg.dart';

class DetailWordCard extends StatelessWidget {
  const DetailWordCard({
    Key? key,
    required this.text,
    this.onTap,
    this.isRight = true,
    this.onLongPress,
  }) : super(key: key);
  final String text;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool isRight;

  // final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SizeEnum.one.value,
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
        onLongPress: onLongPress,
      ),
    );
  }
}
