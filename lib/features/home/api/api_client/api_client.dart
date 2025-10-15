import 'package:dio/dio.dart';
import 'package:elevate_cycle4/core/values/app_endpoints_strings.dart';
import 'package:elevate_cycle4/features/home/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio, {String? baseUrl}) = _HomeApiClient;


  @GET(AppEndPoints.getProductsEndPoint)
  Future<ProductsResponse> getProducts();
}

