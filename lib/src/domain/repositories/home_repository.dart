import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:exam_max_way/src/core/utils/app_constants.dart';
import 'package:exam_max_way/src/data/models/home/banner_response.dart';
import 'package:exam_max_way/src/data/models/home/category_details_response.dart';
import 'package:exam_max_way/src/data/models/home/category_response.dart';
import 'package:exam_max_way/src/data/models/home/detail_products_response.dart';
import 'package:exam_max_way/src/data/models/home/product_response.dart';
import 'package:exam_max_way/src/domain/network/api_client.dart';
import 'package:exam_max_way/src/domain/network/server_error.dart';

class HomeRepository {
  const HomeRepository({required this.apiClient});

  final ApiClient apiClient;

  Future<BannerResponse> getBanner() async {
    dynamic response;
    try {
      response = apiClient.getBanner();
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




  Future<ProductsWithCategoryResponse> getProductWithCategory() async {
    dynamic response;
    try {
      response = await apiClient.getProductWithCategory();
    } on TypeError {
      debugPrint('type error');
    } on NoSuchMethodError {
      debugPrint('no such method error');
    } catch (error, stacktrace) {
      debugPrint('Exception occurred: $error stacktrace: $stacktrace');
      final exception = ServerError.withDioError(
        error: error as DioException,
      );
    }
    return response;
  }

  Future<ProductDetails> getCategoryDetails({
    required String productId}) async {
    dynamic response;
    try {
      response = await apiClient.getProductDetails(productId);
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

  Future<CategoryResponse> getCategory() async {
    dynamic response;
    try {
      response = apiClient.getCategory();
      print('<<<REPOS: ${response}>>>');
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
    // try {
    //   final response = await dio.get(
    //     'https://test.customer.api.delever.uz/v2/category',
    //   );
    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     return ProductCategoryResponse.fromJson(response.data);
    //   }
    //   throw ServerException.fromJson(response.data);
    // } on DioException catch (e) {
    //   throw ServerException.fromJson(e.response?.data);
    // } on FormatException {
    //   throw ServerException(message: 'Something is error');
    // }
  }

  //
  // Future<ProductsResponse>  getDetail()async{
  //   dynamic response;
  //   try {
  //     response = apiClient.getDetailProduct();
  //   } on TypeError {
  //     debugPrint('type error');
  //     // ignore: avoid_catching_errors
  //   } on NoSuchMethodError {
  //     debugPrint('no such method error');
  //     // ignore: avoid_catches_without_on_clauses
  //   } catch (error, stacktrace) {
  //     debugPrint('Exception occurred: $error stacktrace: $stacktrace');
  //     final exception = ServerError.withDioError(
  //       error: error as DioException,
  //     );
  //   }
  //   return response;
  // }
}
