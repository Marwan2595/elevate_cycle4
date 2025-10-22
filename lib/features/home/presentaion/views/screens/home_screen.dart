import 'dart:developer';

import 'package:elevate_cycle4/config/di/di.dart';
import 'package:elevate_cycle4/features/home/domain/models/product_model.dart';
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
      create: (cxt) => homeViewModel..getAllData(),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            // width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PRODUCTS LIST"),
                BlocBuilder<HomeViewModel, HomeStates>(
                  builder: (context, state) {
                    switch (state) {
                      case HomeInitialState():
                      case HomeLoadingState():
                        return const CircularProgressIndicator();
                      case HomeSuccessState():
                        return state.data.isEmpty
                            ? const Text("No Data")
                            : SizedBox(
                                height: 100,

                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      productModel: state.data[index],
                                    );
                                  },
                                ),
                              );
                      case HomeErrorState():
                        return Text(state.errMessage);
                    }
                  },
                ),
                Text("PRODUCTS LIST 2"),
                BlocBuilder<HomeViewModel, HomeStates>(
                  builder: (context, state) {
                    switch (state) {
                      case HomeInitialState():
                      case HomeLoadingState():
                        return const CircularProgressIndicator();
                      case HomeSuccessState():
                        return state.data.isEmpty
                            ? const Text("No Data")
                            : SizedBox(
                                height: 100,

                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      productModel: state.data[index],
                                    );
                                  },
                                ),
                              );
                      case HomeErrorState():
                        return Text(state.errMessage);
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
