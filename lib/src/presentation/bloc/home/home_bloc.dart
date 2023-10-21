import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:exam_max_way/src/data/models/home/banner_response.dart';
import 'package:exam_max_way/src/data/models/home/category_response.dart';
import 'package:exam_max_way/src/data/models/home/product_response.dart';
import 'package:exam_max_way/src/domain/repositories/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
  }) : super(HomeState(selectIndex: [], stateStatus: StateStatus.normal)) {
    on<CategoryEvent>(_category);
    on<BannerEvent>(_banner);
    on<ProductCategoryEvent>(_products);
    on<SelectCategoryEvent>((event, emit) {
      int a = selectIndex.indexOf(event.index);
      if (a == -1) {
        selectIndex.add(event.index);
      } else {
        selectIndex.removeAt(a);
      }
      emit(state.copyWith(
        selectIndex: selectIndex,
        stateStatus: StateStatus.loading,
      ));

      emit(state.copyWith(
        selectIndex: selectIndex,
        stateStatus: StateStatus.loaded,
      ));
    });
  }

  List<int> selectIndex = [];
  late ProductsWithCategoryResponse productRes;
  final HomeRepository homeRepository;

  Future<void> _category(CategoryEvent event, Emitter<HomeState> emit) async {
    final result = await homeRepository.getCategory();
    emit(state.copyWith(categoryResponse: result, selectIndex: selectIndex));
  }

  Future<void> _banner(BannerEvent event, Emitter<HomeState> emit) async {
    final bannerRes = await homeRepository.getBanner();
    emit(state.copyWith(bannerResponse: bannerRes, selectIndex: selectIndex));
  }

  Future<void> _products(
      ProductCategoryEvent event,
      Emitter<HomeState> emit,
      ) async {
    productRes = await homeRepository.getProductWithCategory();

    emit(state.copyWith(
        productsWithCategoryResponse: productRes, selectIndex: selectIndex));
  }
}