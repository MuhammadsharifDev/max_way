import 'package:flutter/material.dart';
import 'package:exam_max_way/src/data/models/profile/branchs_response.dart';
import 'package:exam_max_way/src/domain/network/api_client.dart';

class BranchesRepository {
  final ApiClient apiClient;

  BranchesRepository({required this.apiClient});

  Future<BranchsResponse> getBranches() async {
    dynamic response;
    try {
      response = apiClient.getAllBranches();
    } on TypeError {
      debugPrint('type error');
      // ignore: avoid_catching_errors
    } on NoSuchMethodError {
      debugPrint('no such method error');
      // ignore: avoid_catches_without_on_clauses
    } catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
    }
    return response;
  }
}
