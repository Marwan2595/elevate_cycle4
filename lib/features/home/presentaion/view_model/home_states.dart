import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {
  List<ProductModel> data;
  HomeSuccessState({required this.data});
}

class HomeErrorState extends HomeStates {
  String errMessage;
  HomeErrorState({required this.errMessage});
}
