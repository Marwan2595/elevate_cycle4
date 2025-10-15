import 'package:elevate_cycle4/features/home/api/api_client/api_client.dart';
import 'package:elevate_cycle4/features/home/api/datasources/home_local_datasource_impl.dart';
import 'package:elevate_cycle4/features/home/api/datasources/home_remote_datasource_impl.dart';
import 'package:elevate_cycle4/features/home/data/repo/home_repo_impl.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_cycle4/features/home/domain/usecases/get_products_usecase.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = HomeViewModel(
      GetProductsUseCase(
        HomeRepoImpl(
          HomeRemoteDatasourceImpl(HomeApiClient(Dio())),
          HomeLocalDatasourceImpl(),
        ),
      ),
    );
    homeViewModel.getAllData();
    return const Scaffold(body: Center(child: Text("Home Screen")));
  }
}
