import 'dart:convert';
import 'dart:io';

import 'package:turkce_sozluk/feature/home/model/content_model.dart';

import 'content_service_interface.dart';

class ContentService extends IContentService {
  ContentService(super.dio);

  @override
  Future<ContentModel?> fetchContentModel() async {
    final response = await dio.get(ContentServiceEnum.icerik.withSlash);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.data);
      if (jsonBody is Map<String, dynamic>) {
        return ContentModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}

enum ContentServiceEnum {
  icerik;

  String get withSlash => '/$name';
}
