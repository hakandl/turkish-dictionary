import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';
import '../../constants/enums/svg_enum.dart';
import '../svg.dart';

class EmptyValueView extends StatelessWidget {
  const EmptyValueView({super.key, this.icon = true, required this.text});
  final String text;
  final bool icon;

  @override
  Widget build(BuildContext context) {
    return icon
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgWidget(
                icon: SvgNameEnum.confused.icon,
                color: context.colorScheme.background,
                height: SizeEnum.ninetySix.value,
              ),
              context.emptySizedHeightBoxLow3x,
              _text(context)
            ],
          )
        : Center(child: _text(context));
  }

  Text _text(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
    );
  }
}
