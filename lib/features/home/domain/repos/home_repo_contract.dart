import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/features/home/domain/models/category_model.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';

abstract class HomeRepoContract {
  Future<BaseResponse<List<ProductModel>>> getProducts( {bool isSecondApi = false});

  Future<List<CategoryModel>> getCategories();
}
