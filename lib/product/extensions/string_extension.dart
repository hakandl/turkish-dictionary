import '../constants/enums/string/string_constants.dart';
import '../constants/enums/string_enum.dart';

extension SignLanguageExtension on String {
  String signLanguage() {
    return replaceAll(RegExp("[()/'.,]"), TurkishDictionaryStringConstants.space)
        .replaceAll(SpecialWordEnum.a.value, SpecialWordEnum.a.name)
        .replaceAll(SpecialWordEnum.ii.value, SpecialWordEnum.i.name)
        .replaceAll(SpecialWordEnum.uu.value, SpecialWordEnum.u.name)
        .toLowerCase();
  }
}

extension DetailWordExtension on String {
  String detailWordColon() {
    return replaceAll(RegExp("[:]"), TurkishDictionaryStringConstants.empty).toLowerCase();
  }
}
