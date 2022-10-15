import 'package:dio/dio.dart';
import '../model/detail_model.dart';

abstract class IDetailService {
  IDetailService(this.dio);
  final Dio dio;

  Future<List<DetailModel>?> fetchDetailData();
}
