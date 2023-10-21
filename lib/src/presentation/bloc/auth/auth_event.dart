part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckPhoneEvent extends AuthEvent {
  CheckPhoneEvent({required this.phone});

  final String phone;
}
