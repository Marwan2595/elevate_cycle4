import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/config/base_state/base_state.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_events.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel(this._getProductsUseCase) : super(HomeStates());
  final GetProductsUseCase _getProductsUseCase;

  void doIntent(HomeEvents event) {
    switch (event) {
      case GetAllDataEvent():
        _getAllData();
      case GetProducts1Event():
        _getProducts1();
      case GetProducts2Event(): //dgdfgdfgdfgdfg
        _getProducts2();
    }
  }

  void _getAllData() async {
    await Future.wait([
      _getProducts1(), //2
      _getProducts2(), //3
    ]);
  }

  Future<void> _getProducts1() async {
    emit(
      state.copyWith(
        products1State: BaseState<List<ProductModel>>(isLoading: true),
      ),
    );
    BaseResponse<List<ProductModel>> res = await _getProductsUseCase();
    switch (res) {
      case SuccessResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            products1State: BaseState<List<ProductModel>>(
              isLoading: false,
              data: res.data,
            ),
          ),
        );
      case ErrorResponse<List<ProductModel>>():
        String errMessage = res.error.toString();
        if (res.error is DioException) {
          errMessage = "Helloooooooooooooooo";
        }
        emit(
          state.copyWith(
            products1State: BaseState<List<ProductModel>>(
              isLoading: false,
              errorMessage: errMessage,
            ),
          ),
        );
    }
  }

  Future<void> _getProducts2() async {
    emit(state.copyWith(isLoadingProducts2Param: true));
    await Future.delayed(Duration(seconds: 2));
    BaseResponse<List<ProductModel>> res2 = await _getProductsUseCase(
      isSecondApi: true,
    );
    switch (res2) {
      case SuccessResponse<List<ProductModel>>():
        emit(
          state.copyWith(
            isLoadingProducts2Param: false,
            productsList2Param: res2.data,
          ),
        );
      case ErrorResponse<List<ProductModel>>():
        String errMessage = res2.error.toString();
        if (res2.error is DioException) {
          errMessage = "Helloooooooooooooooo222222";
        }
        emit(
          state.copyWith(
            isLoadingProducts2Param: false,
            errorMessage2Param: errMessage,
          ),
        );
    }
  }
}
