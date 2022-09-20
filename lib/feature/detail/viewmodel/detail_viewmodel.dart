import 'package:flutter/material.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service_interface.dart';

class DetailViewModel extends ChangeNotifier {
  final IDetailService detailService;
  static String? word;

  List<DetailModel>? detailList;

  DetailViewModel(this.detailService) {
    _fetchDetailData();
  }

  Future<void> _fetchDetailData() async {
    detailList = await detailService.fetchDetailData() ?? [];
    notifyListeners();
  }
}
