enum SvgNameEnum {
  splash('ic_turkce_sozluk'),
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

  String get icon => 'assets/icons/$value.svg';
}
