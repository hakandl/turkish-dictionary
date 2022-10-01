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

enum IconNameEnum {
  book('ic_book'),
  check('ic_check'),
  favSolid('ic_fav-solid'),
  fav('ic_fav'),
  hand('ic_hand'),
  history('ic_history'),
  left('ic_left'),
  logo('ic_logo'),
  message('ic_message'),
  more('ic_more'),
  phone('ic_phone'),
  right('ic_right'),
  search('ic_search'),
  trash('ic_trash'),
  voiceSolid('ic_voice-solid'),
  voice('ic_voice'),
  x('ic_x'),
  moon('ic_moon'),
  sun('ic_sun'),
  confused('ic_confused');

  const IconNameEnum(this.value);
  final String value;
}

extension AppPaths on SvgWidget {
  String get iconPath => 'assets/icons/$icon.svg';
}
