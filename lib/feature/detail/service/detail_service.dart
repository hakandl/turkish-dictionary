import 'dart:convert';
import 'dart:io';

import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';

import '../model/detail_model.dart';
import 'detail_service_interface.dart';

class DetailService extends IDetailService {
  DetailService(super.dio);

  @override
  Future<List<DetailModel>?> fetchDetailData() async {
    final response = await dio
        .get('${DetailServiceEnum.gts.withSlash + DetailServiceEnum.ara.questionMark}=${DetailViewModel.word}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.data);
      if (jsonBody is List) {
        return jsonBody.map((e) => DetailModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum DetailServiceEnum {
  gts,
  ara;

  String get withSlash => '/$name';
  String get questionMark => '?$name';
}
