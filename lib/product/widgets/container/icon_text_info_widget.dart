import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';
import '../../constants/enums/svg_enum.dart';
import '../svg.dart';

class IconAndTextInfoWidget extends StatelessWidget {
  const IconAndTextInfoWidget({super.key, this.icon, required this.text});
  final String? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          icon: icon ?? SvgNameEnum.confused.icon,
          height: SizeEnum.sixty.value,
        ),
        context.emptySizedHeightBoxLow3x,
        _text(context)
      ],
    );
  }

  Text _text(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
    );
  }
}
