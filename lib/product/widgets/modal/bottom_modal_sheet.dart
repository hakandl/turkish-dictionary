import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

mixin TurkceSozlukModalSheet {
  Future<T?> showTurkceSozlukModalSheet<T>(
    BuildContext context,
    Widget child,
  ) async {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: context.normalRadius, topRight: context.normalRadius)),
        context: context,
        builder: (context) {
          return _TurkceSozlukModalSheet(
            child: child,
          );
        });
  }
}

class _TurkceSozlukModalSheet extends StatelessWidget {
  const _TurkceSozlukModalSheet({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: context.dynamicHeight(0.2),
        child: Column(
          children: [
            Divider(
              thickness: 4,
              indent: context.dynamicWidth(.42),
              endIndent: context.dynamicWidth(.42),
              color: Colors.black26,
            ),
            const Spacer(),
            child,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
