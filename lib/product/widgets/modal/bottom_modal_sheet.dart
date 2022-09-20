import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

mixin TurkceSozlukModalSheet {
  Future<T?> showTurkceSozlukModalSheet<T>(BuildContext context, Widget child, {double? height}) async {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: context.normalRadius, topRight: context.normalRadius)),
        context: context,
        builder: (context) {
          return _TurkceSozlukModalSheet(
            height: height,
            child: child,
          );
        });
  }
}

class _TurkceSozlukModalSheet extends StatelessWidget {
  const _TurkceSozlukModalSheet({
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
        height: context.dynamicHeight(height ?? 0.3),
        child: Column(
          children: [
            Divider(
              thickness: 4,
              indent: context.dynamicWidth(.42),
              endIndent: context.dynamicWidth(.42),
              color: Colors.black26,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
