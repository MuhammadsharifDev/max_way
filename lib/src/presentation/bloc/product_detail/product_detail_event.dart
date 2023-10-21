part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {}

class AddProductEvent extends ProductDetailEvent {
  final int incrementCount;
  final int addPrice;

  AddProductEvent({required this.incrementCount, required this.addPrice});

  @override
  List<Object?> get props => [incrementCount, addPrice];
}

class RemoveProductEvent extends ProductDetailEvent {
  final int decrementCount;
  final int removePrice;

  RemoveProductEvent({required this.decrementCount, required this.removePrice});

  @override
  List<Object?> get props => [decrementCount, removePrice];
}

// class ChangeProductCountEvent extends ProductDetailEvent {
//   final int count;
//
//   ChangeProductCountEvent({required this.count});
//
//   @override
//   List<Object?> get props => [count];
// }

class LoadDataEvent extends ProductDetailEvent {
  final String productId;

  LoadDataEvent({
    required this.productId,
  });

  @override
  List<Object?> get props => [productId];
}



