import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/repos/home_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable  

class GetProductsUseCase {
  GetProductsUseCase(this.repo);
  final HomeRepoContract repo;

 Future<BaseResponse<List<ProductModel>>> call({bool isSecondApi = false}) => repo.getProducts(isSecondApi: isSecondApi);
}
