import 'dart:convert';
import 'dart:io';

import 'proverb_service_interface.dart';

import '../../../../product/constants/enums/service_enum.dart';
import '../../model/detail_model.dart';
import '../viewmodel/proverb_viewmodel.dart';

class ProverbService extends IProverbService {
  ProverbService(super.dio);

  @override
  Future<List<DetailModel>?> fetchProverbData() async {
    final response =
        await dio.get('${ServiceEnum.gts.withSlash}${ServiceEnum.ara.withQuestionMark}${ProverbViewModel.word}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.data);
      if (jsonBody is List) {
        return jsonBody.map((e) => DetailModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
