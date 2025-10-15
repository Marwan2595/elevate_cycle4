import 'package:elevate_cycle4/features/home/domain/models/category_model.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';

abstract class HomeRepoContract {
  Future<List<ProductModel>> getProducts();

  List<CategoryModel> getCategories();
}
