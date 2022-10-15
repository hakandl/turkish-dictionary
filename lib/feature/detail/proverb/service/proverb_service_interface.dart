import 'package:dio/dio.dart';
import '../../model/detail_model.dart';

abstract class IProverbService {
  IProverbService(this.dio);
  final Dio dio;

  Future<List<DetailModel>?> fetchProverbData();
}
