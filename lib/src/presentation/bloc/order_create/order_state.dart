part of 'order_bloc.dart';

class OrderState extends Equatable {
  final BranchsResponse? branchsResponse;
  final Point? point;
  final Status pickUpPageStatus;
  final Status deliveryPageStatus;

  const OrderState({
    this.branchsResponse,
    this.point,
    this.pickUpPageStatus = Status.initial,
    this.deliveryPageStatus = Status.initial,
  });

  OrderState copyWith({
    BranchsResponse? branchsResponse,
    Point? point,
    Status? pickUpPageStatus,
    Status? deliveryPageStatus,
  }) {
    return OrderState(
      branchsResponse: branchsResponse ?? this.branchsResponse,
      point: point ?? this.point,
      pickUpPageStatus: pickUpPageStatus ?? this.pickUpPageStatus,
      deliveryPageStatus: deliveryPageStatus ?? this.deliveryPageStatus,
    );
  }

  @override
  List<Object?> get props => [
        branchsResponse,
        point,
        pickUpPageStatus,
        deliveryPageStatus,
      ];
}
