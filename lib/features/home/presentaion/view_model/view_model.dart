import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_products_usecase.dart';

class HomeViewModel {
  HomeViewModel(this.getProductsUseCase);
  final GetProductsUseCase getProductsUseCase;
  List<ProductModel> productList = [];
  void getAllData() async {
    getProducts();
  }

  void getCategories() async {}

  void getProducts() async {
    productList = await getProductsUseCase();
    productList.forEach((product) {
      print(product.toString());
    });
  }
}
