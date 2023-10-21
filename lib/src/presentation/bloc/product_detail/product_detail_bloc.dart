import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_max_way/src/data/models/home/category_details_response.dart';
import 'package:exam_max_way/src/data/models/home/detail_products_response.dart';
import 'package:exam_max_way/src/domain/repositories/home_repository.dart';
import 'package:exam_max_way/src/presentation/bloc/auth/auth_bloc.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final HomeRepository homeRepository;

  ProductDetailBloc({required this.homeRepository})
      : super(const ProductDetailState()) {
    on<AddProductEvent>(_increment);
    on<LoadDataEvent>(_loadData);
    on<RemoveProductEvent>(_decrement);

  }

  void _loadData(
    LoadDataEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    ProductDetails result = await homeRepository.getCategoryDetails(
      productId: event.productId,
    );
    emit(
      state.copyWith(
        productDetails: result,
      ),
    );
  }

  // void _changeProductCount(
  //   ChangeProductCountEvent event,
  //   Emitter<ProductDetailState> emit,
  // ) {
  //   emit(state.copyWith(number: event.count <= 1 ? 1 : event.count));
  // }

  _increment(AddProductEvent event, Emitter<ProductDetailState> emit) {
    emit(
      state.copyWith(number: event.incrementCount, coast: event.addPrice),
    );
  }

  _decrement(RemoveProductEvent event, Emitter<ProductDetailState> emit) {
    emit(
      state.copyWith(
          number: event.decrementCount <= 0 ? 0 : event.decrementCount,
          coast: event.removePrice <= 0 ? 0 : event.removePrice),
    );
  }


}
