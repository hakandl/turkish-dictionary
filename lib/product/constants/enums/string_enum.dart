import '../../init/language/locale_keys.g.dart';

enum TabBarPageEnum {
  detail(LocaleKeys.detail_detailViews_detailTitle_explanation),
  proverb(LocaleKeys.detail_detailViews_detailTitle_proverbAndIdioms_title),
  compound(LocaleKeys.detail_detailViews_detailTitle_compoundWord_title);

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
