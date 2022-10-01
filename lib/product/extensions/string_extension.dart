import '../../feature/search/viewmodel/search_viewmodel.dart';

extension SignLanguageExtension on String {
  String signLanguage() {
    return replaceAll(RegExp("[()']"), '%20')
        .replaceAll(SpecialWordEnum.a.value, SpecialWordEnum.a.name)
        .replaceAll(SpecialWordEnum.ii.value, SpecialWordEnum.i.name)
        .replaceAll(SpecialWordEnum.uu.value, SpecialWordEnum.u.name)
        .toLowerCase();
  }
}
