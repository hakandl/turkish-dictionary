import 'package:flutter_tts/flutter_tts.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service_interface.dart';
import 'package:turkce_sozluk/product/utils/loading.dart';

class DetailViewModel extends LoadingStateful {
  final IDetailService detailService;
  static String? word;

  FlutterTts flutterTts = FlutterTts();

  List<DetailModel>? detailList;

  DetailViewModel(this.detailService) {
    _fetchDetailData();
  }

  Future<void> _fetchDetailData() async {
    changeLoading;
    detailList = await detailService.fetchDetailData() ?? [];
    changeLoading;
    notifyListeners();
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('tr-TR');
    await flutterTts.speak(text);
  }
}
