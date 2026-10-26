import 'package:dio/dio.dart';
import 'package:fresh_market/core/networking/api_constants.dart';
import 'package:fresh_market/features/all_products/data/model/products_response_model.dart';
import 'package:fresh_market/features/product_details/data/model/product_details_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  @GET(ApiConstants.allProducts)
  Future<ProductsResponseModel> getProducts(
    // @Query("products_per_page") int productsPerPage,
    @Query("page_number") int pageNumber,
    @Query("name") String name,
  );

  @GET(ApiConstants.productDetails)
  Future<ProductDetailsResponseModel> getProductDetails(
    @Query("slug") String slug,
  );
}
