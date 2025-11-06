import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/features/home/api/datasources/home_local_datasource_impl.dart';
import 'package:elevate_cycle4/features/home/api/datasources/home_remote_datasource_impl.dart';
import 'package:elevate_cycle4/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle4/features/home/data/repo/home_repo_impl.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_repo_impl_test.mocks.dart';

//AAA
//ARRANGE, ACT, ASSERT
@GenerateMocks([HomeRemoteDatasourceImpl, HomeLocalDatasourceImpl])
void main() {
  late HomeRepoImpl homeRepoImpl;
  late MockHomeRemoteDatasourceImpl mockRemoteDatasourceImpl;
  late MockHomeLocalDatasourceImpl mockLocalDatasourceImpl;

  setUpAll(() {
    //ARRANGE
    provideDummy<BaseResponse<List<ProductDto>>>(
      SuccessResponse<List<ProductDto>>(data: []),
    );

    mockRemoteDatasourceImpl = MockHomeRemoteDatasourceImpl();
    mockLocalDatasourceImpl = MockHomeLocalDatasourceImpl();

    homeRepoImpl = HomeRepoImpl(
      mockRemoteDatasourceImpl,
      mockLocalDatasourceImpl,
    );
  });

  group("getProducts Function Test Cases", () {
    test("Test Success Case With ProductDto non empty list", () async {
      //ARRANGE
      List<ProductDto> dummyProductDTOList = [
        ProductDto(id: "1", title: "Product 1", imageCover: "dummyUrl 1"),
        ProductDto(id: "2", title: "Product 2", imageCover: "dummyUrl 2"),
      ];
      //result ====> SuccessResponse<List<ProductDto>>(data: dummyProductDTOList);
      when(mockRemoteDatasourceImpl.getProducts()).thenAnswer(
        (_) async =>
            SuccessResponse<List<ProductDto>>(data: dummyProductDTOList),
      );
      //ACT

      final result = await homeRepoImpl.getProducts();

      //ASSERT

      expect(result, isA<SuccessResponse<List<ProductModel>>>());
      expect(
        (result as SuccessResponse<List<ProductModel>>).data.length,
        dummyProductDTOList.length,
      );

      expect(result.data[0].id, dummyProductDTOList[0].id);
      expect(result.data[0].name, dummyProductDTOList[0].title);
      expect(result.data[0].image, dummyProductDTOList[0].imageCover);

      expect(result.data[1].id, dummyProductDTOList[1].id);
      expect(result.data[1].name, dummyProductDTOList[1].title);
      expect(result.data[1].image, dummyProductDTOList[1].imageCover);

      verify(mockRemoteDatasourceImpl.getProducts()).called(1);
    });
    test("Test Success Case With ProductDto empty list", () async {
      //ARRANGE

      when(
        mockRemoteDatasourceImpl.getProducts(),
      ).thenAnswer((_) async => SuccessResponse<List<ProductDto>>(data: []));
      //ACT

      final result = await homeRepoImpl.getProducts();

      //ASSERT

      expect(result, isA<SuccessResponse<List<ProductModel>>>());
      expect(
        (result as SuccessResponse<List<ProductModel>>).data.length,
        isZero,
      );
      verify(mockRemoteDatasourceImpl.getProducts()).called(1);
    });
    test("Test Error Case", () async {
      //ARRANGE
      Exception dummyException = Exception("Something went wrong");
      when(mockRemoteDatasourceImpl.getProducts()).thenAnswer(
        (_) async => ErrorResponse<List<ProductDto>>(error: dummyException),
      );
      //ACT

      final result = await homeRepoImpl.getProducts();

      //ASSERT

      expect(result, isA<ErrorResponse<List<ProductModel>>>());
      expect(
        (result as ErrorResponse<List<ProductModel>>).error.toString(),
        dummyException.toString(),
      );
      verify(mockRemoteDatasourceImpl.getProducts()).called(1);
    });
  });
}
