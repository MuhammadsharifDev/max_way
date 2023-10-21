part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  StateStatus stateStatus;
  final BannerResponse? bannerResponse;
  final CategoryResponse? categoryResponse;
  ProductsWithCategoryResponse? productsWithCategoryResponse;
  List<int> selectIndex;

  HomeState(
      {this.bannerResponse,
        this.categoryResponse,
        this.productsWithCategoryResponse,
        required this.selectIndex,
        required this.stateStatus});

  HomeState copyWith(
      {BannerResponse? bannerResponse,
        CategoryResponse? categoryResponse,
        ProductsWithCategoryResponse? productsWithCategoryResponse,
        required List<int> selectIndex,
        StateStatus stateStatus = StateStatus.normal}) {
    return HomeState(
        selectIndex: selectIndex,
        bannerResponse: bannerResponse ?? this.bannerResponse,
        categoryResponse: categoryResponse ?? this.categoryResponse,
        productsWithCategoryResponse:
        productsWithCategoryResponse ?? this.productsWithCategoryResponse,
        stateStatus: stateStatus);
  }

  @override
  List<Object?> get props => [
    categoryResponse,
    bannerResponse,
    productsWithCategoryResponse,
    selectIndex,
    stateStatus
  ];
}

enum StateStatus { loading, loaded, normal }