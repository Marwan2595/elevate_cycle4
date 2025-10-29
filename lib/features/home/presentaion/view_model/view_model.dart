import 'dart:developer';

import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel(this.getProductsUseCase) : super(HomeInitialState());
  final GetProductsUseCase getProductsUseCase;

  void getAllData() async {
    getProducts();
  }

  void getCategories() async {}

  void getProducts() async {
    emit(HomeLoadingState());
    List<ProductModel> productList = await getProductsUseCase();
    emit(HomeSuccessState(data: productList));
  }

  void getProducts2() async {
    emit(HomeLoadingState());
    List<ProductModel> productList = await getProductsUseCase();
    emit(HomeSuccessState(data: productList));
  }

  void getProducts3() async {
    emit(HomeLoadingState());
    List<ProductModel> productList = await getProductsUseCase();
    emit(HomeSuccessState(data: productList));
  }

  void getProducts4() async {
    emit(HomeLoadingState());
    List<ProductModel> productList = await getProductsUseCase();
    emit(HomeSuccessState(data: productList));
  }

  void getProducts5() async {
    emit(HomeLoadingState());
    List<ProductModel> productList = await getProductsUseCase();
    emit(HomeSuccessState(data: productList));
  }
}
