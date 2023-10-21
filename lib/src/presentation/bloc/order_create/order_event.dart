part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {}

class BranchsEvent extends OrderEvent {
  BranchsEvent();

  @override
  List<Object?> get props => [];
}

class BranchsLocationEvent extends OrderEvent {
  final Point point;

  BranchsLocationEvent({
    required this.point,
  });

  @override
  List<Object?> get props => [point];
}



class CurrentLocationEvent extends OrderEvent{
  CurrentLocationEvent();

  @override
  List<Object?> get props => [];
}