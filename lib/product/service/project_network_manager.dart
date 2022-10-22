import 'package:dio/dio.dart';

import '../constants/enums/string/string_constants.dart';

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: TurkceSozlukStringConstants.baseUrl));
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;
}
