part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class CategoryEvent extends HomeEvent{
  CategoryEvent();
}
class BannerEvent extends HomeEvent{
  BannerEvent();
}

class ProductCategoryEvent extends HomeEvent{
  ProductCategoryEvent();
}
class SelectCategoryEvent extends HomeEvent{
  int index;

  SelectCategoryEvent({required this.index});
}