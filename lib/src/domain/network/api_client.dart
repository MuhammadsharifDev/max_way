import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:exam_max_way/src/core/utils/app_constants.dart';
import 'package:exam_max_way/src/data/models/auth/check_phone_response.dart';
import 'package:exam_max_way/src/data/models/auth/registr_phone_request.dart';
import 'package:exam_max_way/src/data/models/home/banner_response.dart';
import 'package:exam_max_way/src/data/models/home/category_details_response.dart';
import 'package:exam_max_way/src/data/models/home/category_response.dart';
import 'package:exam_max_way/src/data/models/home/product_response.dart';
import 'package:exam_max_way/src/data/models/profile/branchs_response.dart';

part 'api_client.g.dart';

Chuck alice = Chuck(
  navigatorKey: rootNavigatorKey,
  showInspectorOnShake: true,
);

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    return _ApiClient(dio);
  }

  @GET('v1/banner')
  Future<BannerResponse> getBanner();

  @GET('v2/category')
  Future<CategoryResponse> getCategory();

  @GET('v2/category-with-products')
  Future<ProductsWithCategoryResponse> getProductWithCategory();

  @GET('v2/product/{product_id}')
  Future<ProductDetails> getProductDetails(
      @Path('product_id') String? productId,
      );

  @POST('v1/customers/phone')
  Future<CheckPhoneResponse> checkPhone(
      @Body() RegisterPhoneRequest request);

  @GET('/v1/branches')
  Future<BranchsResponse> getAllBranches();
}