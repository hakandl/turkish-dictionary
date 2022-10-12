import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({Key? key, this.height = 24, this.color = Colors.white, required this.icon}) : super(key: key);
  final double? height;
  final Color? color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: height,
    );
  }
}

/* enum SvgNameEnum {
  check('ic_check'),
  hand('ic_hand'),
  left('ic_left'),
  right('ic_right'),
  search('ic_search'),
  voice('ic_voice'),
  x('ic_x'),
  moon('ic_moon'),
  sun('ic_sun'),
  confused('ic_confused');

  const SvgNameEnum(this.value);
  final String value;
}

extension AppPaths on SvgWidget {
  String get iconPath => 'assets/icons/$icon.svg';
} */
