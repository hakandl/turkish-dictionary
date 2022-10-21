import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({Key? key, this.height = 24, this.color, required this.icon}) : super(key: key);
  final double? height;
  final Color? color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color ?? context.colorScheme.background,
      height: height,
    );
  }
}
