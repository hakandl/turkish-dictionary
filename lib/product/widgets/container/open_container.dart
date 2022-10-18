import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';

class OpenContainerWidget extends StatelessWidget {
  const OpenContainerWidget({super.key, required this.closedBuilder, required this.openBuilder, this.closedElevation});
  final Widget Function(BuildContext, void Function()) closedBuilder;
  final Widget Function(BuildContext, void Function()) openBuilder;
  final double? closedElevation;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: closedElevation ?? SizeEnum.zero.value,
        openColor: context.colorScheme.primary,
        closedColor: Colors.transparent,
        closedBuilder: closedBuilder,
        openBuilder: openBuilder);
  }
}
