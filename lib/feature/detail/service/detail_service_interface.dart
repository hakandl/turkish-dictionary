import 'package:dio/dio.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';

abstract class IDetailService {
  IDetailService(this.dio);
  final Dio dio;

  Future<List<DetailModel>?> fetchDetailData();
}
