import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:exam_max_way/src/data/models/profile/branchs_response.dart';
import 'package:exam_max_way/src/domain/network/api_client.dart';
import 'package:exam_max_way/src/domain/network/server_error.dart';

class OrderCreateRepository {

  final ApiClient apiClient;

  OrderCreateRepository({required this.apiClient});


  Future<BranchsResponse> getBranches() async{
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
      final exception = ServerError.withDioError(
        error: error as DioException,
      );
    }
    return response;
  }

}