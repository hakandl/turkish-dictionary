import 'package:dio/dio.dart';
import 'package:turkce_sozluk/feature/home/model/content_model.dart';

abstract class IContentService {
  IContentService(this.dio);
  final Dio dio;

  Future<ContentModel?> fetchContentModel();
}
