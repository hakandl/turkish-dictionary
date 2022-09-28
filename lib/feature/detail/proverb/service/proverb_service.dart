import 'dart:convert';
import 'dart:io';

import 'package:turkce_sozluk/feature/detail/proverb/service/proverb_service_interface.dart';

import '../../model/detail_model.dart';
import '../viewmodel/proverb_viewmodel.dart';

class ProverbService extends IProverbService {
  ProverbService(super.dio);

  @override
  Future<List<DetailModel>?> fetchProverbData() async {
    final response = await dio
        .get('${ProverbServiceEnum.gts.withSlash + ProverbServiceEnum.ara.questionMark}=${ProverbViewModel.word}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.data);
      if (jsonBody is List) {
        return jsonBody.map((e) => DetailModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum ProverbServiceEnum {
  gts,
  ara;

  String get withSlash => '/$name';
  String get questionMark => '?$name';
}
