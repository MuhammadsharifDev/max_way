part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable {
  final BranchsResponse? branchsResponse;
  final Status status;

  const ProfileState({this.branchsResponse, this.status=Status.initial});

  ProfileState copyWith({BranchsResponse? branchsResponse, Status? status}) {
    return ProfileState(
        branchsResponse: branchsResponse ?? this.branchsResponse,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [branchsResponse,status];
}

enum Status { initial, loading, success, error }

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
