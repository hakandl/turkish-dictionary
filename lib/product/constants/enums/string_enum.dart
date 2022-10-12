import '../../init/language/locale_keys.g.dart';

enum TabBarPageEnum {
  detail(LocaleKeys.detail_detailTitle_explanation),
  proverb(LocaleKeys.detail_detailTitle_proverbAndIdioms),
  compound(LocaleKeys.detail_detailTitle_compoundWord);

  const TabBarPageEnum(this.name);
  final String name;
}

enum SpecialWordEnum {
  c('ç'),
  g('ğ'),
  i('ı'),
  o('ö'),
  s('ş'),
  u('ü'),
  a('â'),
  ii('î'),
  uu('û');

  const SpecialWordEnum(this.value);
  final String value;
}
