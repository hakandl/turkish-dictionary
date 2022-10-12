import 'package:flutter_tts/flutter_tts.dart';
import 'package:turkce_sozluk/core/constants/enums/app_language_enums.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service_interface.dart';
import 'package:turkce_sozluk/product/utils/loading.dart';

class DetailViewModel extends LoadingStateful {
  final IDetailService detailService;
  static String? word;
  late final FlutterTts _flutterTts;

  List<DetailModel>? detailList;

  DetailViewModel(this.detailService) {
    _fetchDetailData();
    _flutterTts = FlutterTts();
  }

  Future<void> _fetchDetailData() async {
    changeLoading;
    detailList = await detailService.fetchDetailData() ?? [];
    changeLoading;
    notifyListeners();
  }

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage(AppLanguageEnum.tr.value);
    await _flutterTts.speak(text);
  }
}
