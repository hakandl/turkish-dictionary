import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../svg.dart';

class EmptyValueView extends StatelessWidget {
  const EmptyValueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          icon: IconNameEnum.confused.value,
          color: context.colorScheme.background,
          height: 96,
        ),
        context.emptySizedHeightBoxLow3x,
        Text(
          LocaleKeys.not_found.tr(),
          style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
        )
      ],
    );
  }
}
