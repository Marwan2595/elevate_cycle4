import 'package:elevate_cycle4/core/values/app_endpoints_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: AppEndPoints.baseUrl));
}
