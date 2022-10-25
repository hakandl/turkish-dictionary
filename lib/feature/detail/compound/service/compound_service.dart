import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../product/constants/enums/service_enum.dart';
import '../../model/detail_model.dart';
import '../viewmodel/compound_viewmodel.dart';
import 'compound_service_interface.dart';

class CompoundService extends ICompoundService {
  CompoundService(super.dio);

  @override
  Future<List<DetailModel>?> fetchCompoundData() async {
    try {
      final response =
          await dio.get('${ServiceEnum.gts.withSlash}${ServiceEnum.search.withQuestionMark}${CompoundViewModel.word}');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = jsonDecode(response.data);
        if (jsonBody is List) {
          return jsonBody.map((e) => DetailModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (e) {
      return throw Exception(e.message);
    }
    return null;
  }
}
