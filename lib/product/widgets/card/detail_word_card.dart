import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/constants/enums/string/string_constants.dart';

import '../../constants/enums/svg_enum.dart';
import '../svg.dart';

class DetailWordCard extends StatelessWidget {
  const DetailWordCard({
    Key? key,
    this.child,
    this.onTap,
    this.isRight = true,
    this.onLongPress,
    this.title,
  }) : super(key: key);
  final Widget? child;
  final String? title;
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
        title: child ??
            Text(
              title ?? TurkceSozlukStringConstants.empty,
              style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
            ),
        trailing: isRight
            ? SvgWidget(
                icon: SvgNameEnum.right.icon,
                color: context.colorScheme.onSecondary,
              )
            : const SizedBox.shrink(),
        shape: RoundedRectangleBorder(
          borderRadius: context.lowBorderRadius,
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
