import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/features/home/data/datasources/home_local_datasource_contract.dart';
import 'package:elevate_cycle4/features/home/data/datasources/home_remote_datasource_contact.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle4/features/home/domain/models/category_model.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/repos/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImpl implements HomeRepoContract {
  HomeRemoteDataSourceContract remoteDataSource;
  HomeLocalDataSourceContract localDataSource;
  HomeRepoImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<CategoryModel>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<List<ProductModel>>> getProducts( {bool isSecondApi = false}) async {
    BaseResponse<List<ProductDto>> productsResponse = await remoteDataSource.getProducts(isSecondApi: isSecondApi);
    switch (productsResponse) {
      case SuccessResponse<List<ProductDto>> ():
        List<ProductDto> productsDTOs = productsResponse.data;
        List<ProductModel> products = productsDTOs
            .map((e) => e.toDomain())
            .toList();
        return SuccessResponse<List<ProductModel>>(data: products);
      case ErrorResponse<List<ProductDto>> ():
        return ErrorResponse<List<ProductModel>>(error: productsResponse.error);
    }
  }
}
