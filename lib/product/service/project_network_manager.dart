import 'package:dio/dio.dart';

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    var baseUrl = 'https://sozluk.gov.tr';
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;
}
