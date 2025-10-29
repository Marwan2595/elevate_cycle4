import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/features/home/api/api_client/api_client.dart';
import 'package:elevate_cycle4/features/home/data/datasources/home_remote_datasource_contact.dart';
import 'package:elevate_cycle4/features/home/data/models/category_dto.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle4/features/home/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDatasourceImpl implements HomeRemoteDataSourceContract {
  HomeRemoteDatasourceImpl(this.homeApiClient);
  HomeApiClient homeApiClient;

  @override
  Future<BaseResponse<List<ProductDto>>> getProducts({
    bool isSecondApi = false,
  }) async {
    try {
      ProductsResponse productsResponse = isSecondApi
          ? await homeApiClient.getProducts2()
          : await homeApiClient.getProducts();
      List<ProductDto> products = productsResponse.data ?? [];
      return SuccessResponse<List<ProductDto>>(data: products);
    } catch (e) {
      return ErrorResponse<List<ProductDto>>(error: e as Exception);
    }
  }

  @override
  Future<List<CategoryDto>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
