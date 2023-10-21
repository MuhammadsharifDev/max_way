part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final CheckPhoneResponse? checkPhoneResponse;
  final Status status;

  const AuthState({
    this.checkPhoneResponse,
    this.status = Status.initial,
  });

  AuthState copyWith({
    CheckPhoneResponse? checkPhoneResponse,
    Status? status,
  }) {
    return AuthState(
      checkPhoneResponse: checkPhoneResponse ?? this.checkPhoneResponse,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        checkPhoneResponse,
        status,
      ];
}

enum Status { initial, loading, success, error }

extension StatusExtension on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
