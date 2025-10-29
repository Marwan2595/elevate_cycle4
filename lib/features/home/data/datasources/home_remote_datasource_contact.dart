

import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/features/home/data/models/category_dto.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';

abstract class HomeRemoteDataSourceContract {
   Future<BaseResponse<List<ProductDto>>> getProducts({bool isSecondApi = false});

  Future<List<CategoryDto>> getCategories();
}
