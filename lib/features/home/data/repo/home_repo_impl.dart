import 'package:elevate_cycle4/features/home/data/datasources/home_remote_datasource_contact.dart';
import 'package:elevate_cycle4/features/home/domain/models/category_model.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/repos/home_repo_contract.dart';

class HomeRepoImpl implements HomeRepoContract {
  HomeRemoteDataSourceContract remoteDataSource;
  HomeRepoImpl(this.remoteDataSource);

  @override
  List<CategoryModel> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
