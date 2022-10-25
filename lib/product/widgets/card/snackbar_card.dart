import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../init/language/locale_keys.g.dart';

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
            label: LocaleKeys.button_ok.tr(),
            textColor: context.colorScheme.background,
            onPressed: () {},
          ),
        );
}
