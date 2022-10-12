import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../../constants/enums/size_enum.dart';
import '../../constants/enums/svg_enum.dart';
import '../svg.dart';

class EmptyValueView extends StatelessWidget {
  const EmptyValueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          icon: SvgNameEnum.confused.icon,
          color: context.colorScheme.background,
          height: SizeEnum.ninetySix.value,
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
