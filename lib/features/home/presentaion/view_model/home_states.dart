import 'package:elevate_cycle4/config/base_state/base_state.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';

class HomeStates {
  BaseState<List<ProductModel>>? products1State;

  bool isLoadingProducts2 = false;
  List<ProductModel> productsList2 = [];
  String? errorMessage2;

  HomeStates({
    this.products1State,
    this.isLoadingProducts2 = true,
    this.productsList2 = const [],
    this.errorMessage2,
  });

  HomeStates copyWith({
    BaseState<List<ProductModel>>? products1State,

    bool? isLoadingProducts2Param, //false
    List<ProductModel>? productsList2Param,
    String? errorMessage2Param, //errormsg
  }) {
    return HomeStates(
      products1State: products1State ?? this.products1State,
      isLoadingProducts2: isLoadingProducts2Param ?? isLoadingProducts2,
      productsList2: productsList2Param ?? productsList2,
      errorMessage2: errorMessage2Param ?? errorMessage2,
    );
  }
}


//Use This if you need to add more properties to the base state
class Products1State extends BaseState<List<ProductModel>> {
  Products1State({
    bool? isLoading,
    List<ProductModel>? data,
    String? errorMessage,
    
  }) : super(isLoading: isLoading, data: data, errorMessage: errorMessage);
}
