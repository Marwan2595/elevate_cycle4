import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';

abstract class HomeRemoteDataSourceContract {
  Future<List<ProductModel>> getProducts();
}
