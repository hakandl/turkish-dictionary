import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../button/normal_elevated_button.dart';

mixin TurkceSozlukShowDialog {
  Future<T?> showTurkceSozlukShowDialog<T>(BuildContext context,
      {required String title, required String content, required VoidCallback yesButton, VoidCallback? noButton}) async {
    return showDialog(
      context: context,
      builder: (context) => TurkceSozlukAlertDialog(
        title: title,
        content: content,
        yesButton: yesButton,
        noButton: noButton,
      ),
    );
  }
}

class TurkceSozlukAlertDialog extends StatelessWidget {
  const TurkceSozlukAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.yesButton,
    this.noButton,
  }) : super(key: key);
  final String title;
  final String content;
  final VoidCallback yesButton;
  final VoidCallback? noButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
      ),
      content: Text(
        content,
        style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
      ),
      actions: [
        TurkceSozlukNormalElevatedButton(
          onPressed: noButton ?? () => context.pop(),
          child: Text(LocaleKeys.button_no.tr()),
        ),
        TurkceSozlukNormalElevatedButton(
          onPressed: yesButton,
          child: Text(LocaleKeys.button_yes.tr()),
        ),
      ],
    );
  }
}
