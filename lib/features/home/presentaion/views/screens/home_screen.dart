import 'dart:developer';

import 'package:elevate_cycle4/config/di/di.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_events.dart';
import 'package:elevate_cycle4/features/home/presentaion/view_model/home_states.dart';

import 'package:elevate_cycle4/features/home/presentaion/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (cxt) => homeViewModel..doIntent(GetAllDataEvent()),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            // width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PRODUCTS LIST 1"),
                BlocBuilder<HomeViewModel, HomeStates>(
                  builder: (context, state) {
                    if (state.products1State?.errorMessage != null &&
                        state.products1State!.errorMessage!.isNotEmpty) {
                      return Text(state.products1State!.errorMessage!);
                    } else if (!(state.products1State?.isLoading ?? false) &&
                        state.products1State?.data != null &&
                        state.products1State!.data!.isNotEmpty) {
                      return SizedBox(
                        height: 100,

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.products1State!.data!.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              productModel: state.products1State!.data![index],
                            );
                          },
                        ),
                      );
                    } else if (!(state.products1State?.isLoading ?? false) &&
                        state.products1State?.data != null &&
                        state.products1State!.data!.isEmpty) {
                      return Text("No Data");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                  buildWhen: (previous, current) {
                    return !(current.isLoadingProducts2 !=
                        previous.isLoadingProducts2);
                  },
                ),
                Text("PRODUCTS LIST 2"),
                BlocBuilder<HomeViewModel, HomeStates>(
                  builder: (context, state) {
                    if (state.errorMessage2 != null &&
                        state.errorMessage2!.isNotEmpty) {
                      return Text(state.errorMessage2!);
                    } else if (!state.isLoadingProducts2 &&
                        state.productsList2.isNotEmpty) {
                      return SizedBox(
                        height: 100,

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.productsList2.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              productModel: state.productsList2[index],
                            );
                          },
                        ),
                      );
                    } else if (!state.isLoadingProducts2 &&
                        state.productsList2.isEmpty) {
                      return Text("No Data");
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.productModel});
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(productModel.name),
    );
  }
}

// BlocBuilder ===> rebuild ui based on state
// BlocListener ===> do action depending on state
// BlocConsumer ==> BlocBuilder + BlocListener
