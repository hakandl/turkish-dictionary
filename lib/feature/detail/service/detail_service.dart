import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../viewmodel/detail_viewmodel.dart';

import '../../../product/constants/enums/service_enum.dart';
import '../model/detail_model.dart';
import 'detail_service_interface.dart';

class DetailService extends IDetailService {
  DetailService(super.dio);

  @override
  Future<List<DetailModel>?> fetchDetailData() async {
    try {
      final response =
          await dio.get('${ServiceEnum.gts.withSlash}${ServiceEnum.ara.withQuestionMark}${DetailViewModel.word}');
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
