import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:exam_max_way/src/data/models/profile/branchs_response.dart';
import 'package:exam_max_way/src/domain/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.branchsRepository}) : super(ProfileState()) {
    on<BranchsEvent>(_getAllBranchs);
  }

  final BranchesRepository branchsRepository;


  Future<void>  _getAllBranchs(BranchsEvent event,Emitter<ProfileState>emit)async {
    emit(state.copyWith(status: Status.loading),);
    final result= await branchsRepository.getBranches();
    emit(state.copyWith(status:Status.success,branchsResponse: result),);
  }
}
