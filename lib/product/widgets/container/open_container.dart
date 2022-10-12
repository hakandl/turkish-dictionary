import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';

class OpenContainerWidget extends StatelessWidget {
  const OpenContainerWidget({super.key, required this.closedBuilder, required this.openBuilder});
  final Widget Function(BuildContext, void Function()) closedBuilder;
  final Widget Function(BuildContext, void Function()) openBuilder;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: SizeEnum.zero.value,
        openColor: context.colorScheme.primary,
        closedColor: context.colorScheme.primary,
        closedShape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
        closedBuilder: closedBuilder,
        openBuilder: openBuilder);
  }
}
