import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SnackBarCard extends SnackBar {
  SnackBarCard(BuildContext context, {super.key, required String content})
      : super(
          content: Text(
            content,
            style: TextStyle(color: context.colorScheme.background),
          ),
          duration: context.durationNormal,
          backgroundColor: context.colorScheme.primary,
          action: SnackBarAction(
            label: 'tamam',
            textColor: context.colorScheme.background,
            onPressed: () {},
          ), /*  */
        );
}
