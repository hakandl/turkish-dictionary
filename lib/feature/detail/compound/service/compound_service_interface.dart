import 'package:dio/dio.dart';
import '../../model/detail_model.dart';

abstract class ICompoundService {
  ICompoundService(this.dio);
  final Dio dio;

  Future<List<DetailModel>?> fetchCompoundData();
}
