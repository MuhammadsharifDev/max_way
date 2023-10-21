import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:exam_max_way/src/data/models/profile/branchs_response.dart';
import 'package:exam_max_way/src/domain/repositories/order_create_repsository.dart';
import 'package:exam_max_way/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({required this.orderCreateRepository}) : super(const OrderState()) {
    on<BranchsEvent>(_getBranch);
    on<BranchsLocationEvent>(_getBranchLocation);
    on<CurrentLocationEvent>(_getCurrentLocation);
  }

  final OrderCreateRepository orderCreateRepository;

  Future<void> _getBranch(BranchsEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(pickUpPageStatus: Status.loading));
    final result = await orderCreateRepository.getBranches();

    emit(
      state.copyWith(
        branchsResponse: result,
        pickUpPageStatus: Status.success,
      ),
    );
  }

  Future<void> _getBranchLocation(
    BranchsLocationEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(
      state.copyWith(point: event.point),
    );
  }

  Future<void> _getCurrentLocation(
    CurrentLocationEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(deliveryPageStatus: Status.loading));
    var permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.denied) {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      emit(
        state.copyWith(
          point: Point(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        ),
      );
    }
    emit(state.copyWith(deliveryPageStatus: Status.success));
  }
}
// serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
// if (!serviceEnabled) {
// return Future.error('Location services are disabled');
// }
//
// permission = await Geolocator.checkPermission();
//
// if (permission == LocationPermission.denied) {
// permission = await Geolocator.requestPermission();
//
// if (permission == LocationPermission.denied) {
// return Future.error("Location permission denied");
// }
// }
//
// if (permission == LocationPermission.deniedForever) {
// return Future.error('Location permissions are permanently denied');
// }
//
// Position position = await Geolocator.getCurrentPosition();
//
// return position;
// }
