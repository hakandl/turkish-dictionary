import 'package:dio/dio.dart';

import '../model/content_model.dart';

abstract class IContentService {
  IContentService(this.dio);
  final Dio dio;

  Future<ContentModel?> fetchContentModel();
}
