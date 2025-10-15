import 'package:elevate_cycle4/features/home/data/models/category_dto.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';


abstract class HomeLocalDataSourceContract {
   Future<List<ProductDto>> getProducts();

  Future<List<CategoryDto>> getCategories();
}
