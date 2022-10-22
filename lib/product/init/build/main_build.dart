import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../../widgets/container/no_network_container.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Text(
        LocaleKeys.info_anErrorOccured.tr(),
        textAlign: TextAlign.center,
        style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
      );
    };
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox.shrink(),
        ),
        const NoNetworkContainer()
      ],
    );
  }
}
