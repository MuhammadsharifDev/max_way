class ProductDetailArgument {
  final String productId;
  final String productName;
  final String productDescription;
  final int outPrice;
  final String currency;


  ProductDetailArgument({
    required this.outPrice,
    required this.currency,
    required this.productId,
    required this.productDescription,
    required this.productName,
  });
}
