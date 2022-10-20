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
  trash('ic_trash'),
  confused('ic_confused'),
  home('ic_home'),
  history('ic_history'),
  fav('ic_fav'),
  favSolid('ic_fav_solid');

  const SvgNameEnum(this.value);
  final String value;

  String get icon => 'assets/icons/$value.svg';
}
