import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elevate_cycle4/config/base_response/base_response.dart';
import 'package:elevate_cycle4/config/base_state/base_state.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_events.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Bloc<HomeEvents, HomeStates> {
  HomeViewModel(this.getProductsUseCase) : super(HomeStates()) {
    //Tranform event into function

    on<GetAllDataEvent>(_getAllData);
    on<GetProducts1Event>(_getProducts1);
    on<GetProducts2Event>(_getProducts2);
  }
  final GetProductsUseCase getProductsUseCase;

  void _getAllData(GetAllDataEvent event, Emitter<HomeStates> emit) async {
    await Future.wait([
      _getProducts1(GetProducts1Event(), emit), //2
      _getProducts2(GetProducts2Event(), emit), //3
    ]);
  }

  Future<void> _getProducts1(
    GetProducts1Event event,
    Emitter<HomeStates> emit,
  ) async {
    emit(
      state.copyWith(
        products1State: BaseState<List<ProductModel>>(isLoading: true),
      ),
    );
    BaseResponse<List<ProductModel>> res = await getProductsUseCase();
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

  Future<void> _getProducts2(
    GetProducts2Event event,
    Emitter<HomeStates> emit,
  ) async {
    emit(state.copyWith(isLoadingProducts2Param: true));
    await Future.delayed(Duration(seconds: 2));
    BaseResponse<List<ProductModel>> res2 = await getProductsUseCase(
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
