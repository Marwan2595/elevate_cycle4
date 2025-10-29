import 'package:elevate_cycle4/features/home/data/datasources/home_local_datasource_contract.dart';
import 'package:elevate_cycle4/features/home/data/models/category_dto.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLocalDataSourceContract)
class HomeLocalDatasourceImpl implements HomeLocalDataSourceContract {
  @override
  Future<List<ProductDto>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryDto>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
