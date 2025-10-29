import 'package:dio/dio.dart';
import 'package:elevate_cycle4/core/values/app_endpoints_strings.dart';
import 'package:elevate_cycle4/features/home/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClient {
  @factoryMethod
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(AppEndPoints.getProductsEndPoint)
  Future<ProductsResponse> getProducts();

  @GET(AppEndPoints.getProductsEndPoint2)
  Future<ProductsResponse> getProducts2();
}
