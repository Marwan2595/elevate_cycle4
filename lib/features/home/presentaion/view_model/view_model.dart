import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_products_usecase.dart';

class HomeViewModel {
  HomeViewModel(this.getProductsUseCase);
  final GetProductsUseCase getProductsUseCase;
  List<ProductModel> productList = [];
  void getProducts() async {
    productList = await getProductsUseCase.call();
  }
}
