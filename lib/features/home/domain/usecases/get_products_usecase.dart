import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/repos/home_repo_contract.dart';

class GetProductsUseCase {
  GetProductsUseCase(this.repo);
  final HomeRepoContract repo;

  Future<List<ProductModel>> call() => repo.getProducts();
}
