import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../init/language/locale_keys.g.dart';

import '../button/normal_elevated_button.dart';

mixin TurkishDictionaryShowDialog {
  Future<T?> showTurkishDictionaryShowDialog<T>(BuildContext context,
      {required String title, required String content, required VoidCallback yesButton}) async {
    return showDialog(
      context: context,
      builder: (context) => TurkishDictionaryAlertDialog(
        title: title,
        content: content,
        yesButton: yesButton,
      ),
    );
  }
}

class TurkishDictionaryAlertDialog extends StatelessWidget {
  const TurkishDictionaryAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.yesButton,
  }) : super(key: key);
  final String title;
  final String content;
  final VoidCallback yesButton;

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
        TurkishDictionaryNormalElevatedButton(
          onPressed: () => context.pop(),
          child: Text(LocaleKeys.button_no.tr()),
        ),
        TurkishDictionaryNormalElevatedButton(
          onPressed: yesButton,
          child: Text(LocaleKeys.button_yes.tr()),
        ),
      ],
    );
  }
}
