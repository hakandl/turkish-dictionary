import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../product/constants/enums/service_enum.dart';
import '../model/content_model.dart';
import 'content_service_interface.dart';

class ContentService extends IContentService {
  ContentService(super.dio);

  @override
  Future<ContentModel?> fetchContentModel() async {
    try {
      final response = await dio.get(ServiceEnum.content.withSlash);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = jsonDecode(response.data);
        if (jsonBody is Map<String, dynamic>) {
          return ContentModel.fromJson(jsonBody);
        }
      }
    } on DioError catch (e) {
      return throw Exception(e.message);
    }
    return null;
  }
}
