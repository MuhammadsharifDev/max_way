import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:exam_max_way/src/data/models/auth/check_phone_response.dart';
import 'package:exam_max_way/src/data/models/auth/registr_phone_request.dart';
import 'package:exam_max_way/src/domain/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<CheckPhoneEvent>(_checkPhoneEvent);
  }

  final AuthRepository authRepository;

  Future<void> _checkPhoneEvent(
    CheckPhoneEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final result = await authRepository.checkPhone(
        RegisterPhoneRequest(phone: event.phone),
      );
      emit(
        state.copyWith(
          checkPhoneResponse: result,
          status: Status.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: Status.error),
      );
    }
  }
}
