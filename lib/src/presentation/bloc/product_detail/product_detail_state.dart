part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final int number;
  final int coast;
  final ProductDetails? productDetails;
  final Status status;


  const ProductDetailState({
    this.coast=0,
    this.number = 0,
    this.productDetails,
    this.status = Status.initial,
  });

  ProductDetailState copyWith({
    int? number,
    int? coast,
    ProductsResponse? productsResponse,
    ProductDetails? productDetails,
  }) {
    return ProductDetailState(
      coast: coast??this.coast,
      number: number ?? this.number,
      productDetails: productDetails ?? this.productDetails,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [number, productDetails, status,coast];
}
