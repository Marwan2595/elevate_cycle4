import 'package:elevate_cycle4/features/home/data/datasources/home_local_datasource_contract.dart';
import 'package:elevate_cycle4/features/home/data/datasources/home_remote_datasource_contact.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle4/features/home/domain/models/category_model.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/repos/home_repo_contract.dart';

class HomeRepoImpl implements HomeRepoContract {
  HomeRemoteDataSourceContract remoteDataSource;
  HomeLocalDataSourceContract localDataSource;
  HomeRepoImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<CategoryModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      List<ProductDto> productsDTOs = await remoteDataSource.getProducts();
      List<ProductModel> products = productsDTOs
          .map((e) => e.toDomain())
          .toList();
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
