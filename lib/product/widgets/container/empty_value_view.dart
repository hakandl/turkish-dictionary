import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../svg.dart';

class EmptyValueView extends StatelessWidget {
  const EmptyValueView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgWidget(
            icon: IconNameEnum.confused.value,
            color: context.colorScheme.onSecondary,
            height: 96,
          ),
          context.emptySizedHeightBoxLow,
          Text(
            LocaleKeys.not_found.tr(),
            style: context.textTheme.headline5,
          )
        ],
      ),
    );
  }
}
