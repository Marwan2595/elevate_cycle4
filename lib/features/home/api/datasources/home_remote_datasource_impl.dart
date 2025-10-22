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
  Future<List<ProductDto>> getProducts() async {
    try {
      ProductsResponse productsResponse = await homeApiClient.getProducts();
      List<ProductDto> products = productsResponse.data ?? [];
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CategoryDto>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
