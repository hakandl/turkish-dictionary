import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';

mixin TurkishDictionaryModalSheet {
  Future<T?> showTurkishDictionaryModalSheet<T>(BuildContext context, Widget child, {double? height}) async {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: context.normalRadius, topRight: context.normalRadius)),
        context: context,
        builder: (context) {
          return _TurkishDictionaryModalSheet(
            height: height,
            child: child,
          );
        });
  }
}

class _TurkishDictionaryModalSheet extends StatelessWidget {
  const _TurkishDictionaryModalSheet({
    Key? key,
    required this.child,
    this.height,
  }) : super(key: key);
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: context.dynamicHeight(height ?? SizeEnum.zThree.value),
        child: Column(
          children: [
            Divider(
              thickness: SizeEnum.four.value,
              indent: context.dynamicWidth(SizeEnum.zFortyTwo.value),
              endIndent: context.dynamicWidth(SizeEnum.zFortyTwo.value),
              color: context.colorScheme.onSecondary,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
