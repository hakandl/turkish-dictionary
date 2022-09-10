import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({Key? key, this.height = 24, this.width = 24, this.color = Colors.white, required this.icon})
      : super(key: key);
  final double? height;
  final double? width;
  final Color? color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      color: color,
      height: height,
      width: width,
    );
  }
}

extension AppPaths on SvgWidget {
  String get iconPath => 'assets/icons/$icon.svg';
}
